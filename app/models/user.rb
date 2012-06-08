# == Schema Information
#
# Table name: users
#
#  id                  :integer         not null, primary key
#  email               :string(255)
#  first_name          :string(255)
#  last_name           :string(255)
#  created_at          :datetime        not null
#  updated_at          :datetime        not null
#  password_salt       :string(255)
#  persistence_token   :string(255)
#  single_access_token :string(255)
#  perishable_token    :string(255)
#  login_count         :integer
#  failed_login_count  :integer
#  last_request_at     :datetime
#  current_login_at    :datetime
#  last_login_at       :datetime
#  current_login_ip    :string(255)
#  last_login_ip       :string(255)
#  crypted_password    :string(255)
#  user_type_id        :integer
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#

require 'open-uri'
require 'yaml'
class User < ActiveRecord::Base
  attr_accessible :id, :email, :first_name, :last_name, :password, 
		  :majors_attributes, :major_ids, :major_id, :majors,
		  :minors_attributes, :minor_ids, :minor_id, :minors,
		  :skill_list, :interest_list, 
		  :programs, :program_ids, :program_id,
		  :user_type, :user_type_id, :authentications, :avatar,
		  :teams_attributes, :team_ids, :teams, :team_memberships
  
  acts_as_authentic do |c|
    c.ignore_blank_passwords = true #ignore passwords
    c.validate_password_field = false #ignore validations for passwords
    c.require_password_confirmation = false
    c.logged_in_timeout = 30.minutes # default is 30.minutes
  end 
  
  acts_as_taggable
  acts_as_taggable_on :skills, :interests

  # Many-to-many relationships.
  has_and_belongs_to_many :majors
  accepts_nested_attributes_for :majors, allow_destroy: true 

  has_and_belongs_to_many :minors
  accepts_nested_attributes_for :minors, allow_destroy: true

  has_and_belongs_to_many :organizations

  # Programs, Teams | ~> Entouragi   
  has_many :program_affiliations
  has_many :programs, :through => :program_affiliations

  has_many :team_memberships
  has_many :teams, :through => :team_memberships

  # One-to-many relationships.
  belongs_to :user_type

  has_many :authentications, :dependent => :destroy

  has_many :startups, :inverse_of => :user

  has_attached_file :avatar, {
    :styles => { :thumbnail => "50x50#", :medium => "120x120#" },
    :storage => Rails.env.production? ? :s3 : :filesystem,
    :s3_credentials => YAML::load File.read("#{RAILS_ROOT}/config/amazon_s3.yml"),
    :path => ":attachment/:id/:style.:extension"
  }
  
  validate do |user|
    if user.new_record?
      user.errors.add(:password, "is required") if user.password.blank?
    #adds validation only if password is modified
    elsif !(!user.new_record? && user.password.blank? && user.password_confirmation.blank?) 
      user.errors.add(:password, "is required") if user.password.blank?
    end
  end  

  validates :first_name,  :presence => true,
            :length   => { :maximum => 50 }
 
  validates :last_name,  :presence => true,
            :length   => { :maximum => 50 }
 
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, :presence => true,
            :format   => { :with => email_regex },
            :uniqueness => { :case_sensitive => false }

  validates :password,  :presence   => true,
            :confirmation   => true,
            :length     => { :within => 6..20 },
	    :on => :create
		
  validate :avatar_size
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png', 'image/gif']

  validates_attachment_size :avatar, :less_than=>700.kilobytes, 
                    :if => Proc.new { |imports| !imports.avatar_file_name.blank? }
	
  def full_name
    "#{first_name} #{last_name}"
  end
  
  def possessive_name
	p = "#{first_name} #{last_name}"
	if p[-1] == "s"
		p+= "'"
	else
		p += "'s"
	end
	return p
  end

  def self.create_from_hash(hash)
    user = User.new(:first_name => hash['info']['first_name'],
		    		:last_name => hash['info']['last_name']) 
    case hash['provider']
	when 'linkedin'
		user.avatar_from_url(hash['info']['image']) 
	when 'google'
		user.email = hash['info']['email']	
    end 
    #create the user without performing validations. This is because most of the fields are not set.
    user.save(:validate => false)  
    #set persistence_token else sessions will not be created
    user.reset_persistence_token!  
    user
  end
  
  def avatar_size
    temp_file = avatar.queued_for_write[:original] #get the file that is being uploaded
    if (temp_file) 
      dimensions = Paperclip::Geometry.from_file(temp_file)
      if (dimensions.width < 50) || (dimensions.height < 50)
        errors.add("photo_size", "must be image size 50x50.")
      end
    end
  end

  def avatar_from_url(url)
    self.avatar = open(url)
  end
end

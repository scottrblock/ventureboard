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
#

class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, 
		  :majors_attributes, :major_ids, :major_id, :majors,
		  :minors_attributes, :minor_ids, :minor_id, :minors,
		  :skill_list, :interest_list,
		  :user_type_id,
	          :authentications
  
  acts_as_authentic do |c|
    c.ignore_blank_passwords = true #ignore passwords
    c.validate_password_field = false #ignore validations for passwords
    c.require_password_confirmation = false
  end 
  
  acts_as_taggable
  acts_as_taggable_on :skills, :interests

  # Many-to-many relationships.
  has_and_belongs_to_many :majors
  accepts_nested_attributes_for :majors, allow_destroy: true 

  has_and_belongs_to_many :minors
  accepts_nested_attributes_for :minors, allow_destroy: true

  has_and_belongs_to_many :organizations
  has_many :authentications, :dependent => :destroy

  # Groups: Programs, Startups, Teams | ~> Entouragi   
  #  accepts_nested_attributes_for :organizations, allow_destroy: true

  # One-to-many relationship.
  belongs_to :user_type

=begin
  has_attached_file :avatar, {
    :styles => { :medium => "50x50#" },
    :storage => Rails.env.production? ? :s3 : :filesystem,
    :bucket => 'weareumd', #config this too.
    :s3_credentials => "#{Rails.root}/config/amazon_s3.yml" #have to config this file.
  }
=end
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
    #create the user without performing validations. This is because most of the fields are not set.
    user.save(:validate => false)  
    #set persistence_token else sessions will not be created
    user.reset_persistence_token!  
    user
  end
end

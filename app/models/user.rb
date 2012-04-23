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
#

class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password

  acts_as_authentic do |c|
    c.login_field :email
    c.require_password_confirmation = false 
  end

  # Many-to-many relationships.
  has_and_belongs_to_many :interests
  has_and_belongs_to_many :skills
  has_and_belongs_to_many :majors
  has_and_belongs_to_many :minors
  has_and_belongs_to_many :organizations

  # One-to-many relationship.
  belongs_to :user_type

  has_attached_file :avatar, {
    :styles => { :medium => "50x50#" },
    :storage => Rails.env.production? ? :s3 : :filesystem,
    :bucket => 'weareumd', #config this too.
    :s3_credentials => "#{Rails.root}/config/amazon_s3.yml" #have to config this file.
  }

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
            :length     => { :within => 6..20 }

  def full_name
    "#{first_name} #{last_name}"
  end
  
  def possessive_name
	p = "#{first_name} #{last_name}"
	if [-1] == "s"
		p+= '\'' if p[-1] == 's'
	else
		p += "'s"
	end
	return p
  end

end

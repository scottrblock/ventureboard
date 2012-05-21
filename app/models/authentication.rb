# == Schema Information
#
# Table name: authentications
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  provider   :string(255)
#  uid        :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  token      :string(255)
#  secret     :string(255)
#

class Authentication < ActiveRecord::Base
	attr_accessible :user_id, :uid, :provider, :token, :secret
	belongs_to :user
	validates :user_id, :uid, :provider, :token, :secret, :presence => true
	validates_uniqueness_of :uid, :scope => :provider

	def self.find_from_hash(hash)
          debugger
          uid = hash['uid']
	  provider = hash['provider']

	  find_by_provider_and_uid(provider, uid)
	end

	def self.create_from_hash(hash, user = nil)
	  user ||= User.create_from_hash(hash)
	  Authentication.create(:user_id => user.id, 
		 	        :uid => hash['uid'], 
				:provider => hash['provider'],
				:token => hash['credentials']['token'],
				:secret => hash['credentials']['secret'])
	end
end

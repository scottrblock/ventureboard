class Authentication < ActiveRecord::Base
	attr_accessible :user_id, :uid, :provider
	belongs_to :user
	validates :user_id, :uid, :provider, :presence => true
	validates_uniqueness_of :uid, :scope => :provider

	def self.find_from_hash(hash)
          debugger
          uid = hash['uid']
	  provider = hash['provider']

	  find_by_provider_and_uid(provider, uid)
	end

	def self.create_from_hash(hash, user = nil)
	  user ||= User.create_from_hash(hash)
	  Authentication.create(:user_id => user.id, :uid => hash['uid'], :provider => hash['provider'])
	end
end

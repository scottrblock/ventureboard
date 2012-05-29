class Team < ActiveRecord::Base
	
  has_many :team_memberships
  has_many :users, :through => :team_memberships
  belongs_to :startup

end

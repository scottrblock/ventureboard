# == Schema Information
#
# Table name: teams
#
#  id         :integer         not null, primary key
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  startup_id :integer
#

class Team < ActiveRecord::Base
  attr_accessible :id, :users, :user_ids, :team_memberships

  has_many :team_memberships, :dependent => :destroy
  has_many :users, :through => :team_memberships

 
  belongs_to :startup, :inverse_of => :team
  validates_associated :startup
  validates_presence_of :users
end

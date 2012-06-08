# == Schema Information
#
# Table name: team_memberships
#
#  id         :integer         not null, primary key
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  leader     :boolean         default(FALSE)
#  title      :string(255)
#  user_id    :integer
#  team_id    :integer
#

class TeamMembership < ActiveRecord::Base
  attr_accessible :title, :leader, :user, :user_id, :team, :team_id
  belongs_to :user
  belongs_to :team

  validates_uniqueness_of :user_id, :scope => :team_id 

end

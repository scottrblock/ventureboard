class AddLeaderToTeamMembership < ActiveRecord::Migration
  def self.up
    add_column :team_memberships, :leader, :boolean, :default => false 
  end

  def self.down
    remove_column :team_memberships, :leader 
  end
end

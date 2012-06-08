class AddUserIdColumnToTeamMembership < ActiveRecord::Migration
  def self.up
	 add_column :team_memberships, :user_id, :integer 
  end

  def self.down
	 remove_column :team_memberships, :user_id 
  end
end

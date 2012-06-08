class AddTeamIdColumnToTeamMembership < ActiveRecord::Migration
  def self.up
	 add_column :team_memberships, :team_id, :integer 
  end

  def self.down
	 remove_column :team_memberships, :team_id 
  end

end

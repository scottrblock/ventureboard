class AddTitleToTeamMembership < ActiveRecord::Migration
  def self.up
    add_column :team_memberships, :title, :string 
  end

  def self.down
    remove_column :team_memberships, :title
  end
end

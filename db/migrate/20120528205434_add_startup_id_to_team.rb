class AddStartupIdToTeam < ActiveRecord::Migration
  def self.up
    add_column :teams, :startup_id, :integer 
    add_index :teams, :startup_id
  end

  def self.down
    remove_column :teams, :startup_id 
    remove_index :teams, :column => :startup_id
  end

end

class AddUserIdToStartup < ActiveRecord::Migration
  def self.up
    add_column :startups, :user_id, :integer
    add_index :startups, :user_id 
  end

  def self.down
    remove_column :startups, :user_id
    remove_index :startups, :column => :user_id
  end

end

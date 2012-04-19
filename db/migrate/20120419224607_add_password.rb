class AddPassword < ActiveRecord::Migration
  def up
    add_column :users, :crypted_password, :string 
  end

  def down
    remove_column :users, :crypted_password
  end
end

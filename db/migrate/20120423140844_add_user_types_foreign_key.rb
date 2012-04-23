class AddUserTypesForeignKey < ActiveRecord::Migration
  def up
    add_column :user_types, :user_id, :integer
  end

  def down
    remove_column :user_types, :user_id
  end
end

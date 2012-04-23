class RemoveUserTypesForeignKey < ActiveRecord::Migration
  def up
    remove_column :user_types, :user_id
  end

  def down
    add_column :user_types, :user_id, :integer
  end
end

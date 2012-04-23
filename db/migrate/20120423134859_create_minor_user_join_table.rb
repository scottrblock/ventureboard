class CreateMinorUserJoinTable < ActiveRecord::Migration
  def up
    create_table :minors_users, :id => false do |t|
      t.integer :minor_id
      t.integer :user_id
    end
  end

  def down
    drop_table:minors_users
  end
end

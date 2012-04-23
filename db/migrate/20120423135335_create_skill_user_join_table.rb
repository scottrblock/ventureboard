class CreateSkillUserJoinTable < ActiveRecord::Migration
  def up
    create_table :skills_users, :id => false do |t|
      t.integer :skills_id
      t.integer :user_id
    end
  end

  def down
    drop_table:skills_users
  end
end

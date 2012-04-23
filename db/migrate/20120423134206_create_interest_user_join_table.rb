class CreateInterestUserJoinTable < ActiveRecord::Migration
  def up
    create_table :interests_users, :id => false do |t|
      t.integer :interest_id
      t.integer :user_id
    end
  end

  def down
    drop_table:interests_users     
  end
end

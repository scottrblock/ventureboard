class CreateMinors < ActiveRecord::Migration
  def change
    create_table :minors do |t|
      t.string :name

      t.timestamps
    end
  end
end

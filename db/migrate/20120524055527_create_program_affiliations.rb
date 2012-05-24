class CreateProgramAffiliations < ActiveRecord::Migration
  def change
    create_table :program_affiliations do |t|
      t.references :user
      t.references :program
      t.timestamps
    end
  end
end

class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.references :region, foreign_key: true
      t.references :organisation, foreign_key: true
      t.string :airtable_record

      t.timestamps
    end
  end
end

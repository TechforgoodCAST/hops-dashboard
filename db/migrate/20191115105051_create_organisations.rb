class CreateOrganisations < ActiveRecord::Migration[5.2]
  def change
    create_table :organisations do |t|
      t.string :name
      t.string :registration_type
      t.string :registration_id
      t.integer :income
      t.integer :num_employees

      t.timestamps
    end
  end
end

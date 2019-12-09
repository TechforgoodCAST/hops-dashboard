class CreateCrewLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :crew_locations do |t|
      t.references :crew, foreign_key: true
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end

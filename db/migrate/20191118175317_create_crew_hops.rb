class CreateCrewHops < ActiveRecord::Migration[5.2]
  def change
    create_table :crew_hops do |t|
      t.references :crew, foreign_key: true
      t.references :design_hop, foreign_key: true

      t.timestamps
    end
  end
end

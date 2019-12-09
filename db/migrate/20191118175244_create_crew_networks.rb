class CreateCrewNetworks < ActiveRecord::Migration[5.2]
  def change
    create_table :crew_networks do |t|
      t.references :crew, foreign_key: true
      t.references :network, foreign_key: true

      t.timestamps
    end
  end
end

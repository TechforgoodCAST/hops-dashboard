class CreateHopNetworks < ActiveRecord::Migration[5.2]
  def change
    create_table :hop_networks do |t|
      t.references :design_hop, foreign_key: true
      t.references :network, foreign_key: true

      t.timestamps
    end
  end
end

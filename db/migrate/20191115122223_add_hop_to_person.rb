class AddHopToPerson < ActiveRecord::Migration[5.2]
  def change
    add_reference :people, :design_hop, foreign_key: true
  end
end

class CreateDesignHops < ActiveRecord::Migration[5.2]
  def change
    create_table :design_hops do |t|
      t.references :location, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end

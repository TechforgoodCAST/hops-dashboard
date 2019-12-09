class CreateInteractions < ActiveRecord::Migration[5.2]
  def change
    create_table :interactions do |t|
      t.integer :type
      t.string :action
      t.string :action_id
      t.datetime :date_occured
      t.datetime :date_recorded
      t.string :source
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end

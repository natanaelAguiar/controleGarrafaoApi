class CreateClientBottles < ActiveRecord::Migration[5.2]
  def change
    create_table :client_bottles do |t|
      t.integer :quantity
      t.references :client, foreign_key: true
      t.references :bottle, foreign_key: true

      t.timestamps
    end
  end
end

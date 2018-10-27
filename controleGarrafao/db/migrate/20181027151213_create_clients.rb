class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :street
      t.integer :number
      t.string :rmk
      t.references :bottle, foreign_key: true

      t.timestamps
    end
  end
end

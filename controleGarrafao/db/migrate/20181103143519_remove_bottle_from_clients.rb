class RemoveBottleFromClients < ActiveRecord::Migration[5.2]
  def change
    remove_column :clients, :bottle_id
  end
end

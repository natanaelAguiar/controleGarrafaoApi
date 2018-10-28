class Bottle < ApplicationRecord
  has_many :client_bottles, dependent: :destroy
  has_many :clients, :through => :client_bottles
  validates :name, presence: true

  accepts_nested_attributes_for :client_bottles, allow_destroy: true

  def client_bottles_names
    client_bottles = Array(ClientBottle.where(bottle_id: id))
    client_bottles = client_bottles.map do |client_bottle|
      client_bottle = client_bottle.attributes.merge!({"client_name": Client.find(client_bottle.client_id).name})
      client_bottle = client_bottle.except("bottle_id","created_at","updated_at")
    end
  end

  def as_json(options={})
    super(root: true,
          except: [:created_at, :updated_at, :client_id],
          methods:[:client_bottles_names]
          )
  end
end

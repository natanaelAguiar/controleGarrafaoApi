class Client < ApplicationRecord
  has_many :client_bottles
  has_many :bottles, :through => :client_bottles

  accepts_nested_attributes_for :bottles
  accepts_nested_attributes_for :client_bottles

  def client_bottles_names
    client_bottles = Array(ClientBottle.find_by(client_id: id))
    client_bottles = client_bottles.map do |client_bottle|
      client_bottle = client_bottle.attributes.merge!({"bottle_name": Bottle.find(client_bottle.bottle_id).name})
      client_bottle = client_bottle.except("client_id","created_at","updated_at")
    end
  end

  def as_json(options={})
    super(root: true,
          except: [:created_at, :updated_at],
          methods:[:client_bottles_names]
          )
  end
end

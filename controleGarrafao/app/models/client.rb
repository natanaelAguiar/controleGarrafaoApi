class Client < ApplicationRecord
  has_many :client_bottles, dependent: :destroy
  has_many :bottles, :through => :client_bottles
  validates :street,:number,:client_bottles, presence: true

  accepts_nested_attributes_for :client_bottles, allow_destroy: true

  def client_bottles_names
    client_bottles = Array(ClientBottle.where(client_id: id).limit(nil))
    client_bottles = client_bottles.map do |client_bottle|
      client_bottle = client_bottle.attributes.merge!({"bottle_name": Bottle.find(client_bottle.bottle_id).name})
      client_bottle = client_bottle.except("client_id","created_at","updated_at")
    end
  end

  def as_json(options={})
    super(root: true,
          except: [:created_at, :updated_at, :bottle_id],
          methods:[:client_bottles_names]
          )
  end
end

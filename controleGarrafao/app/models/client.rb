class Client < ApplicationRecord
  has_many :client_bottles, dependent: :destroy
  has_many :bottles, :through => :client_bottles
  validates :street,:number,:client_bottles, presence: true

  accepts_nested_attributes_for :client_bottles, allow_destroy: true

  def as_json(options={})
    super(root: true,
          except: [:created_at, :updated_at, :bottle_id],
          include: {client_bottles: {include: {bottle: {except: [:created_at, :updated_at]}}, only: [:id, :quantity, :bottle]}}
          )
  end
end

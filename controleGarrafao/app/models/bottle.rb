class Bottle < ApplicationRecord
  has_many :client_bottles, dependent: :destroy
  has_many :clients, :through => :client_bottles
  validates :name, presence: true

  accepts_nested_attributes_for :client_bottles, allow_destroy: true

  def as_json(options={})
    super(root: true,
          except: [:created_at, :updated_at, :client_id],
          include: {client_bottles: {include: {client: {except: [:created_at, :updated_at, :bottle_id]}}, only: [:id, :quantity, :client]}}
          )
  end
end

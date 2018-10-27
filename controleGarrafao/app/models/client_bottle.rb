class ClientBottle < ApplicationRecord
  belongs_to :client
  belongs_to :bottle

  accepts_nested_attributes_for :client
  accepts_nested_attributes_for :bottle
end

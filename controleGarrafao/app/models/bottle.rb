class Bottle < ApplicationRecord
  has_many :client_bottles
  has_many :clients, :through => :client_bottles

  accepts_nested_attributes_for :clients
end

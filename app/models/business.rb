class Business < ApplicationRecord
  has_many :agents
  has_many :customers
  has_many :drivers
  has_many :orders
end

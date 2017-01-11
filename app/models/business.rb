class Business < ApplicationRecord
  has_many :agents
  has_many :customers
  has_many :drivers
  has_many :orders

  geocoded_by :address
  after_validation :geocode, if: -> { should_geocode? }
  include Address
end

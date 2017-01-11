class DeliveryAddress < ApplicationRecord
  validates :street_address, :zipcode, presence: true
  has_many :orders

  geocoded_by :address
  after_validation :geocode, if: -> { should_geocode? }
  include Address
end

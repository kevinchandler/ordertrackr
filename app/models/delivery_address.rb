class DeliveryAddress < ApplicationRecord
  validates :street_address, :zipcode, presence: true

  geocoded_by :address
  after_validation :geocode

  private

  def address
    "#{street_address} #{city} #{state} #{zipcode}".strip
  end
end

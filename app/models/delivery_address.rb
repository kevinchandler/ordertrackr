class DeliveryAddress < ApplicationRecord
  validates :street_address, :zipcode, presence: true

  geocoded_by :address
  after_validation :geocode, if: -> { latitude.nil? && longitude.nil? }

  private

  def address
    "#{street_address} #{city} #{state} #{zipcode}".strip
  end
end

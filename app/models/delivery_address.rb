class DeliveryAddress < ApplicationRecord
  validates :street_address, :zipcode, presence: true
  has_many :orders

  geocoded_by :address
  after_validation :geocode, if: -> { latitude.nil? && longitude.nil? }

  def coordinates
    "#{latitude},#{longitude}" if latitude && longitude
  end

  private

  def address
    "#{street_address} #{city} #{state} #{zipcode}".strip
  end
end

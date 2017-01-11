class Business < ApplicationRecord
  has_many :agents
  has_many :customers
  has_many :drivers
  has_many :orders

  geocoded_by :address
  after_validation :geocode, if: -> { should_geocode? }

  def coordinates
    "#{latitude},#{longitude}" if latitude && longitude
  end

  private

  def address
    "#{street_address} #{city} #{state} #{zipcode}".strip
  end

  def should_geocode?
    latitude.nil? || longitude.nil? || street_address_changed? ||
      city_changed? || state_changed? || zipcode_changed?
  end
end

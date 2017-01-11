module Address
  def coordinates
    "#{latitude},#{longitude}" if latitude && longitude
  end

  def address
    "#{street_address} #{city} #{state} #{zipcode}".strip
  end

  def should_geocode?
    latitude.nil? || longitude.nil? || street_address_changed? ||
      city_changed? || state_changed? || zipcode_changed?
  end
end

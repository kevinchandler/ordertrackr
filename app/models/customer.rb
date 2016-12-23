class Customer < ApplicationRecord
  validates :street_address, :zipcode, presence: true
  before_save :standardize_phone

  geocoded_by :address
  after_validation :geocode

  private

  def address
    "#{street_address} #{city} #{state} #{zipcode}".strip
  end

  def standardize_phone
    if self.phone
      phone = self.phone.to_s.gsub(/[^\d]/, '')
      phone[0] = '' if phone.size == 11 && phone[0] == '1'
      self.phone = phone
    end
  end
end

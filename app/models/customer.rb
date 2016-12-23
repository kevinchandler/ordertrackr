class Customer < ApplicationRecord
  validates :address, :zipcode, presence: true

  before_save :standardize_phone

  private

  def standardize_phone
    if self.phone
      phone = self.phone.to_s.gsub(/[^\d]/, '')
      phone[0] = '' if phone.size == 11 && phone[0] == '1'
      self.phone = phone
    end
  end
end

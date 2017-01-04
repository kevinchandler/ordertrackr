class Customer < ApplicationRecord
  belongs_to :business
  before_save :standardize_phone, if: -> { phone_changed? }

  private

  def standardize_phone
    if phone
      phone = self.phone.to_s.gsub(/[^\d]/, '')
      phone[0] = '' if phone.size == 11 && phone[0] == '1'
      self.phone = phone
    end
  end
end

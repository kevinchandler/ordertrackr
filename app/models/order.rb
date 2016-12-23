class Order < ApplicationRecord
  before_save :generate_guid
  validates :customer_id, :user_id, presence: true
  validates :guid, uniqueness: true

  private

  def generate_guid
    self.guid = Digest::SHA2.hexdigest [Time.zone.now, rand].join
  end
end

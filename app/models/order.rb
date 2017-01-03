class Order < ApplicationRecord
  before_create :generate_guid
  validates :customer_id, :agent_id, presence: true
  validates :guid, uniqueness: true
  belongs_to :delivery_address

  scope :complete, -> { where complete: true }
  scope :incomplete, -> { where complete: false }

  def status
    complete ? 'complete' : 'incomplete'
  end

  private

  def generate_guid
    self.guid = Digest::SHA2.hexdigest [Time.zone.now, rand].join
  end
end

class Order < ApplicationRecord
  before_create :generate_guid
  validates :customer_id, :agent_id, :business_id, presence: true
  validates :guid, uniqueness: true, if: -> { guid_changed? }
  belongs_to :business
  belongs_to :delivery_address
  belongs_to :driver

  scope :complete, -> { where complete: true }
  scope :incomplete, -> { where complete: false }

  def complete_order
    self.completed_at = Time.zone.now
    save!
  end

  def current_location
    (in_progress &&
      (driver && driver.coordinates || business.coordinates)
    ) || nil
  end

  def current_latitude
    return nil unless current_location
    current_location.split(',')[0].to_s
  end

  def current_longitude
    return nil unless current_location
    current_location.split(',')[1].to_s
  end

  def in_progress
    complete ? false : true
  end

  def status
    complete ? 'complete' : 'incomplete'
  end

  private

  def generate_guid
    self.guid = Digest::SHA2.hexdigest [Time.zone.now, rand].join
  end
end

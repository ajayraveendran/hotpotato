class Listing < ApplicationRecord
  
  validates :start_price, presence: true
  validates :start_time, presence: true
  validate :start_time_cannot_be_in_the_past, on: :create

  def start_time_cannot_be_in_the_past
    if start_time.present? && start_time <= Time.now.utc
      errors.add(:start_time, "can't be in the past")
    end
  end
end
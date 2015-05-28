class Occasion < ActiveRecord::Base
  has_many :happenings
  has_many :users, through: :happenings
  has_one :receiver
  belongs_to :gift
  validate :expiry_date_is_in_the_future

  def expiry_date_is_in_the_future
    errors.add(:expiry_date, "can't be in the past or be today") if
      !expiry_date.blank? and expiry_date <= Date.today
  end

end

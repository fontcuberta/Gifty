class Occasion < ActiveRecord::Base
  has_many :happenings
  has_many :users, through: :happenings
  has_one :receiver
  has_many :gifts
  validate :expiry_date_is_in_the_future

  def expiry_date_is_in_the_future
    errors.add(:expiry_date, "can't be in the past") if
      !expiry_date.blank? and expiry_date < Date.today
  end

end

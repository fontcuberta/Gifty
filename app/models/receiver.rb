class Receiver < ActiveRecord::Base
  belongs_to :occasion
  validates :name, presence: true
  validates :email, presence: true
end

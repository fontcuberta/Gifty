class Gift < ActiveRecord::Base
  has_many :occasions
  validates :description, presence: true
  validates :url, presence: true
end

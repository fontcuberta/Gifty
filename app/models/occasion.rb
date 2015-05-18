class Occasion < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_one :receiver
	has_many :gifts
end

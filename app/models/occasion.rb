class Occasion < ActiveRecord::Base
	has_many :happenings
	has_many :users, through: :happenings
	has_one :receiver
	has_many :gifts

end

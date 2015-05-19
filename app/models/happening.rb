class Happening < ActiveRecord::Base
  belongs_to :occasion
  belongs_to :user	
end

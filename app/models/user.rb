class User < ActiveRecord::Base
  has_many :happenings
  has_many :occasions, through: :happenings
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end

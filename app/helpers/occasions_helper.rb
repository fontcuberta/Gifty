module OccasionsHelper
  def price_for_each_friend(gift, occasion)
	gift.price/occasion.users.size
  end
end

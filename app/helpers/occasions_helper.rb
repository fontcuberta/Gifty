module OccasionsHelper
  def price_for_each_friend(gift, occasion)
	gift.price/occasion.users.size
  end

  def get_occasion_expiry_date(occasion)
  	#This date format, converter to floating and multiply by 1000 is needes 
  	#(just like that) for JavaScript compare it with JavaScript date format
  	occasion.expiry_date.to_f*1000
  end
end

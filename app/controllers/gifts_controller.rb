class GiftsController < ApplicationController

#CREATE
  def new
  	@occasion = Occasion.find params[:occasion_id]
    @gift = Gift.new
  end

  def create
  	@occasion = Occasion.find params[:occasion_id]
    @gift = Gift.new
  	if @gift.valid?
      flash[:notice] = "You just created a new Gift!"
  		redirect_to user_occasion_path(current_user, @occasion)
  	else
      flash.now[:alert] = "Ooops! Read all your mistakes"
  		render 'new'
  	end
  end

  def edit
    @occasion = Occasion.find params[:occasion_id]
    gift = Gift.find params[:gift_id]
    if @occasion.gifts.size > 0
      #This release the old gift from this event by setting its occasion_id to nil
      old_gift = @occasion.gifts.first
      old_gift.occasion_id = nil
      old_gift.save
    end
    gift.occasion_id = params[:occasion_id]
    gift.save
    redirect_to user_occasion_path(current_user, @occasion)
  end


#SHOW GIFTS (ALL OF THEM)
 def index
    @occasion = Occasion.find params[:occasion_id]
 	  @gifts = Gift.all
 end

 def show

  end

#REMOVE
  def remove
    @occasion = Occasion.find params[:occasion_id]
    gift = Gift.find params[:gift_id]
    gift.occasion_id = nil
    gift.save
    redirect_to user_occasion_path(current_user, @occasion)
  end

#DELETE
  def destroy
    gift = Gift.find_by(id: params[:id])
    unless gift
      render json: {error: "This gift doesn't exist"},
      status: 400
    return
    end
    gift.destroy
    redirect_to gifts_path
  end
end

class GiftsController < ApplicationController
  before_action :authenticate_user!
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

#SHOW GIFTS (ALL OF THEM)
  def index
    @occasion = Occasion.find params[:occasion_id]
 	  @gifts = Gift.all
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

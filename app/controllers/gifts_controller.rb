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

  def update
    gift = Gift.find(:gift_id)
    gift.occasion_id = params[:occasion_id]
    
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
 	  @gifts = Gift.all
 end

 def show

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
    redirect_to gifts_index_path
  end
end

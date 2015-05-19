class OccasionsController < ApplicationController
  before_action :authenticate_user!

#CREATE
  def create
  end

#SHOW OCCASIONS (ALL OF THEM) - FILTERED BY USER
 def index
 	    @user = current_user
 	    @occasions = @user.occasions
      render 'index'
  end


#UPDATE
  def update
    occasion = Occasion.find_by(id: params[:id])
    unless occasion
      render json: {error: "This event doesn't exist"},
      status: 400
    return
    end
    occasion.update(occasion_params)
    render json: occasion
  end

#DELETE
  def destroy
    occasion = Occasion.find_by(id: params[:id])
    unless occasion
      render json: {error: "This event doesn't exist"},
      status: 400
    return
    end
    occasion.destroy
    render json: occasion
  end

#--------------------------------
#Private Methods
  private
  def occasion_params
    params.permit(:description, :expiry_date)
  end

end


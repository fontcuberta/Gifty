class OccasionsController < ApplicationController
  before_action :authenticate_user!
  #before_action :get_occasions, only: %i(index)

#CREATE
  def new
  	@user = current_user
  	@occasion = @user.occasions.new
  end

  def create
  	@user = User.find params[:user_id]
  	@occasion = @user.occasions.create occasion_params
  	if @occasion.valid?
      binding.pry
      flash[:notice] = "You just created a new event!"
  		redirect_to occasions_index_path(@user)
  	else
      flash.now[:alert] = "Ooops! Read all your mistakes"
  		render 'new'
  	end
  end

#SHOW OCCASIONS (ALL OF THEM) - FILTERED BY USER
 def index
 	    @user = current_user
 	    @occasions = @user.occasions
  end

 def show
    @occasion = Occasion.find_by(id: params[:id])

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
    params.require(:occasion).permit(:description, :expiry_date)
  end

  def get_occasions
    @occasions = current_user.occasions
  end

end


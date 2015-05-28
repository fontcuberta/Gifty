class ReceiversController < ApplicationController
  before_action :authenticate_user!
#CREATE
  def new
  	@occasion = Occasion.find params[:occasion_id]
    @receiver = Receiver.new
  end

  def create

  	@occasion = Occasion.find params[:occasion_id]
  	@receiver = @occasion.build_receiver receiver_params

  	if @receiver.save
      flash[:notice] = "Receiver added!"
  		redirect_to user_occasion_path(current_user, @occasion)
  	else
      flash.now[:alert] = "Receiver not added"
  		render 'new'
  	end
  end


# PRIVATE METHODS

  def receiver_params
  	params.require(:receiver).permit(:name, :email, :phone, :address)
  end


end

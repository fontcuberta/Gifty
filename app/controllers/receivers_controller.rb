class ReceiversController < ApplicationController

#CREATE
  def new
  	@occasion = Occasion.find params[:occasion_id]
    @receiver = Receiver.new
  end

  def create
  	@occasion = Occasion.find params[:occasion_id]
  	@receiver = Receiver.create(params[:receiver])
    @occasion.receiver = @receiver
  	if @receiver.valid?
      flash[:notice] = "Receiver added!"
  		redirect_to occasions_index_path(@user)
  	else
      flash.now[:alert] = "Receiver not added"
  		render 'new'
  	end
  end


# PRIVATE METHODS

  def receiver_params
  	params.require[:receiver].permit(:name,
  									 :email,
  									 :phone,
  									 :address)
  end


end

class HappeningsController < ApplicationController


#CREATE -- ADD USER TO A OCCASION (THAT'S A HAPPENING)
  def new
    @occasion = Occasion.find_by(id: params[:occasion_id])
    @user = User.find_by(id: params[:user_id])
    @occasion.users << @user
    redirect_to user_occasion_path(current_user, @occasion)
  end

  def create

    @occasion = Occasion.find_by(id: params[:occasion_id])
    @user = User.find_by(id: params[:user_id])
    @occasion.users << @user

  	if @occasion.users.valid?
      flash[:notice] = "You just added a new member!"
  		redirect_to user_occasion_path(current_user, @occasion)
  	else
      flash.now[:alert] = "Ooops! Read all your mistakes"
  		redirect_to user_occasion_path(current_user, @occasion)
  	end
  end

#DELETE
  def destroy
    @occasion = Occasion.find_by(id: params[:occasion_id])
    @user = User.find_by(id: params[:user_id])
    @occasion.users.delete(@user)
    redirect_to user_occasion_path(current_user, @occasion)
  end
end


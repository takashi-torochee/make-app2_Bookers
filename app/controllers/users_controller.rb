class UsersController < ApplicationController

before_action :correct_user, only:[:edit, :update]

  def index
    @user = current_user
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

   private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
    @user = User.find(params[:id])
     unless @user == current_user
     redirect_to user_path(current_user.id)
     end
  end


end

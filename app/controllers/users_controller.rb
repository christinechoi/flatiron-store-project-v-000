class UsersController < ApplicationController

  def index

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to store_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to store_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  #def get_rid_of_stink
    #@user = User.find(params[:id])
  #end

end

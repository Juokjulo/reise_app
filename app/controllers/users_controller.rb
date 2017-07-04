class UsersController < ApplicationController
  before_action :authenticate_user!
  before_filter :check_privileges!, except: [:show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user or current_user.admin?
      redirect_to root_path, :alert => "Access denied."
    end
  end

  def reset_password
    @user = User.find(params[:userid])
    unless current_user.admin?
      redirect_to root_path, :alert => "Access denied."
    end
   
  end 

  def update_password
    @user = User.find(params[:userid])
    unless current_user.admin?
      redirect_to root_path, :alert => "Access denied."
    end
    if @user.update(user_params)
      redirect_to root_path
    else
      render "reset_password"
    end
  end 
  

  private

  def user_params
    # NOTE: Using `strong_parameters` gem
    params.require(:user).permit(:password, :password_confirmation)
  end
end

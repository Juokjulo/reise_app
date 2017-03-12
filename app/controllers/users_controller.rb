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

end

 
class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  def index
    @users = User.order(:user_type, :email)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path, notice: "User created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def require_admin
    unless current_user.user_type == "admin"
      redirect_to root_path, alert: "Admin access required."
    end
  end

  def user_params
    params.require(:user).permit(
      :name, :email, :password, :user_type
    )
  end
end
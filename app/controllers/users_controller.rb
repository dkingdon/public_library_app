class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

      if @user.save
        login(@user)
        redirect_to @user
      else
        flash[:error] = @user.errors.full_messages.join(", ")
        redirect_to new_user_path
      end
  end

  def show
    user_id = params[:id]
    @user = User.find_by_id(user_id)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end

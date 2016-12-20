class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:email, :password)
    @user = User.confirm(user_params)

    if @user
      login(@user)
      redirect_to @user
    else
      flash[:error] = "Incorrect login information"
      redirect_to login_path
    end
  end


end

class SessionsController < ApplicationController
  protect_from_forgery with: :exception

  include SessionsHelper

  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:email, :password)
    # confirm that email/password combination is correct
    @user = User.confirm(user_params)
    if @user
      login(@user)
      flash[:notice] = "Successfully logged in."
      redirect_to @user
    else
      flash[:notice] = "That password doesn't match that email address."
      redirect_to login_path
    end
  end

  def destroy
    logout # coming soon in SessionsHelper
    flash[:notice] = "Successfully logged out." 
    redirect_to root_path
  end
end

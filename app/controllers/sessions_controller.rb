class SessionsController < ApplicationController
  before_action :logged_in_cant_signin

  def logged_in_cant_signin
    if current_user
      redirect_to user_url(current_user.id)
    end
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email],params[:user][:password])
    if @user
      log_in!(@user)
      redirect_to user_url(current_user.id)
    else
      redirect_to new_session_url
    end
  end

  def destroy
    session[:session_token] = nil
    redirect_to new_session_url
  end
end

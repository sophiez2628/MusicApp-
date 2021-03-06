class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      log_in!(@user)
      redirect_to user_url(@user)
    else
      render :new
    end
  end

  def show
    @bands = Band.all
    render :show
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end

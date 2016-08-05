class SessionsController < ApplicationController
  def index
    render :index
  end

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(user_params[:username], user_params[:password])
    if @user
      login(@user)
      redirect_to users_url
    else
      flash.now[:errors] = ["Invalid credentials"]
      render :new
    end
  end

  def destroy
    @user = current_user
    logout
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end

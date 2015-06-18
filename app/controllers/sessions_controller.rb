class SessionsController < ApplicationController
  def index
    @user = User.new
  end

  def login
    p params
    @user = User.find_by(username: sessions_params[:username])
    if @user.password == params[:password]
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      redirect_to :back
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to posts_path
  end

  private

  def sessions_params
    params.require(:user).permit(:username, :password)
  end
end

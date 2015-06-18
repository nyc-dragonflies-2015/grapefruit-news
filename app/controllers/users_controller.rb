class UsersController < ApplicationController

  def show
  end

  def create
    @user = User.new(users_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      redirect_to :back
    end
  end

  def edit
  end

  def update
  end

  private

  def users_params
    params.require(:users).permits(:username, :password, :email, :about, :email, :karma)
  end
end

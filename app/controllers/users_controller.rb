class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
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

  def posts
    @user = User.find_by(id: params[:id])
    @posts = Post.where(user_id: @user.id)
  end

  def comments
  end

  private

  def users_params

    params.require(:user).permit(:username, :password, :about, :email, :karma)
  end
end

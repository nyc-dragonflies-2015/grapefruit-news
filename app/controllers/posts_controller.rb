class PostsController < ApplicationController
  before_action :is_user_logged_in?, except: [:index, :show]
  def index
    @posts = Post.order(:created_at)
  end

  def new
    @post = Post.new
  end

  def create
    if post_has_content_and_url?
      redirect_to :back
    else
      @post = Post.new(post_params)
      if @post.save
        redirect_to @post
      else
        redirect_to :back
      end
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    if @post.url
      redirect_to "#{@post.url}"
    else
      render
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, :user_id)
  end

  def post_has_content_and_url?
    if post_params[:url] != "" && post_params[:content] != ""
      return true
    end
  end

  def is_user_logged_in?
    return true if session[:user_id]
  end

end

class PostsController < ApplicationController
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
      redirect_to @post
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content)
  end

  def post_has_content_and_url?
    if post_params[:url] && post_params[:content]
      return true
    end
  end

end

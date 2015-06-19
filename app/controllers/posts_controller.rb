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
      nillify_blanks!
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
    @comments = Comment.where(post_id: @post.id)
    if @post
      if @post.url
        redirect_to "#{@post.url}"
      else
        render
      end
    else
      redirect_to root_path
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    if post_has_content_and_url?
      redirect_to :back
    else
      nillify_blanks!
      @post.assign_attributes(post_params)
      if @post.save
        redirect_to @post
      else
        redirect_to :back
      end
    end
  end

  def destroy
    @user = User.find_by(id: session[:user_id])
    Post.find_by(id: params[:id]).destroy
    redirect_to user_posts_path(@user)
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

  def nillify_blanks!
    params[:post][:url] = nil if post_params[:url] == ""
    params[:post][:content] = nil if post_params[:content] == ""
  end


  def is_user_logged_in?
    return true if session[:user_id]
  end

end

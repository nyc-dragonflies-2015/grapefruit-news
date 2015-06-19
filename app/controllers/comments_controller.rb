class CommentsController < ApplicationController
  before_action :must_be_logged_in

  def new
    @post = Post.find_by(id: params[:post_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_path(params[:post_id])
    else
      flash[:error] = "There was a problem with your comment"
      redirect_to :back
    end
  end

  def edit
    @comment = Comment.find_by(id: params[:id])
    @post = Post.find_by(id: params[:post_id])
    binding.pry
  end

  def update
    p params
    render plain: "update comment!!!"
  end

  def destroy
    render plain: "destroy comment!!!"
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end


end

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
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    @comment.assign_attributes(comment_params)
    if @comment.save
      redirect_to post_path(params[:post_id])
    else
      flash[:error] = "There was a problem with your comment" #need to make this clearer or possibly just update attributes since there isn't much that can go wrong with a comment.
      redirect_to :back
    end
  end

  def destroy
    post = Post.find_by(id: params[:post_id])
    Comment.find_by(id: params[:id]).destroy
    redirect_to post
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end


end

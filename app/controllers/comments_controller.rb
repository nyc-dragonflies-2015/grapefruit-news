# I'm not crazy about this thing...
class CommentsController < ApplicationController
  before_action :must_be_logged_in

  def new
    @post = Post.find_by(id: params[:post_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      # It's kinda janky to redirect based on this post param
      #
      # `redirect_to @comment.post` would be good
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
      # Seems good
      flash[:error] = "There was a problem with your comment" #need to make this clearer or possibly just update attributes since there isn't much that can go wrong with a comment.
      redirect_to :back
    end
  end

  def destroy
    # elegant.
    post = Post.find_by(id: params[:post_id])
    Comment.find_by(id: params[:id]).destroy
    redirect_to post
  end

  private

  def comment_params
    # You shouldn't have to be pulling this form the forms
    #
    # 1.  Your user_id should be in the session
    # 2.  The post_id should be inferrable from the comment most of the time,
    # no?
    #
    params.require(:comment).permit(:content, :post_id, :user_id)
  end


end

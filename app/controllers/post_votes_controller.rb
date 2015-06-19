class PostVotesController < ApplicationController
  before_action :must_be_logged_in
  def create
    @vote = PostVote.create(post_vote_params)
    redirect_to :back
  end

  def destroy
    PostVote.find_by(id: params[:id]).destroy
    redirect_to :back
  end

  private

  def post_vote_params
    params.permit(:user_id, :post_id, :vote)
  end
end

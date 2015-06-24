module ApplicationHelper
  def the_signed_in_user
    # We don't need explicit return in Ruby
    return User.find_by(id: session[:user_id])
  end

  def the_user_wrote_this_post(post)
    # shorter as:
    #   the_signed_in_user.id == post.user.id
    #
    #   In the event it doesn't work that's nil == post.user.id, which is
    #   falsey
    if session[:user_id]
      return true if the_signed_in_user.id == post.user.id
    end
  end

  def the_user_wrote_this_comment(comment)
    if session[:user_id]
      return true if the_signed_in_user.id == comment.user.id
    end
  end


  def the_user_is_signed_in
    # shorter
    #
    # session[:user_id]
    return true if session[:user_id]
  end

  def user_has_voted_for_post(post)
    return true if session[:user_id] && post.post_votes.find_by(user_id: the_signed_in_user.id)
  end
  def the_user_and_posts_vote(post)
    PostVote.find_by(user_id: the_signed_in_user.id, post_id: post.id)
  end
end

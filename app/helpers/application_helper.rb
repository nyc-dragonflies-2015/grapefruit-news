module ApplicationHelper
  def the_signed_in_user
    return User.find_by(id: session[:user_id])
  end

  def the_user_wrote_this_post(post)
    if session[:user_id]
      return true if the_signed_in_user.id == post.user.id
    end
  end
end

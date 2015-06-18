module ApplicationHelper
  def the_signed_in_user
    return User.find_by(id: session[:user_id])
  end
end

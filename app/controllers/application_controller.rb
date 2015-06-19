class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def logged_in?
    !!session[:user_id]
  end

  def must_be_logged_in
    unless logged_in?
      flash[:error] = "Ya need to be logged in you sneak!"
      redirect_to login_page_path
    end
  end
end

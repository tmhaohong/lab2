class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :sign_in?

  def current_user
  	if session[:user_id]
  		User.find(session[:user_id])
  	else
  		nil
  	end
  end

  def sign_in?
  	if current_user
  		true
  	end
  end

  def require_login
  	if !sign_in?
  		flash[:waring] = 'Please login!!!'
  		redirect_to login_path
  	end
  end
end

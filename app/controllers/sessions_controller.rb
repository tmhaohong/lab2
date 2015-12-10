class SessionsController < ApplicationController
  def new
  	render "login"
  end

  def create
  	@existedUser = User.find_by(email: params[:user][:email])
  	
  	if(@existedUser && @existedUser.authenticate(params[:user][:password]))
  		redirect_to users_path
  	else
  		render "login"
  	end
  end

end

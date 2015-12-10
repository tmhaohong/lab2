class SessionsController < ApplicationController
  def new
    if sign_in?
      redirect_to users_path
    else
  	 render "login"
    end
  end

  def create
  	@existedUser = User.find_by(email: params[:user][:email])
  	
  	if(@existedUser && @existedUser.authenticate(params[:user][:password]))
      session[:user_id] = @existedUser.id

      flash[:sucsess] = 'You are so awesome!'

  		redirect_to users_path
  	else
      flash[:error] = 'Username or password is not correct!'
  		render "login"
  	end
  end

  def destroy
    session[:user_id] = nil
    flash[:warning] = 'Goodbye and See you again!'
    redirect_to :root
  end

end

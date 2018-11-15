class SessionsController < ApplicationController

  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:username] = user.username
      session[:user_id] = user.id
      session[:email] = user.email
  
      redirect_to '/'
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    session[:username] = nil
    session[:email] = nil
    redirect_to '/'
  end

end
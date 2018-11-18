class UsersController < ApplicationController

  def create
    user = User.new
    user.username = params[:username]
    user.email = params[:email]
    user.password= params[:password]
    user.is_active = true

    if user.save
      session[:username] = user.username
      session[:user_id] = user.id
      session[:email] = user.email

      redirect_to '/'
    else
      render :new
    end
  end

end

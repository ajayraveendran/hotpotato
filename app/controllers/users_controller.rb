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

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.username = params[:username]
    user.email = params[:email]
    user.password= params[:password]
        
    if user.save
      session.delete(:user_id)
      redirect_to "/"
    else
      redirect_to "/users/#{user.id}/edit"
    end
  end



end

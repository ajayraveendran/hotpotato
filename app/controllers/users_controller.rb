class UsersController < ApplicationController

  def create
    user = User.new
    user.username = params[:username]
    user.email = params[:email]
    user.password= params[:password]
    user.save
    redirect_to '/'
    # binding.pry
  end
end

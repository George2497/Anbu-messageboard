class SessionsController < ApplicationController

  def index
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    # Authenticate the user's credentials
    if user && user.authenticate(params[:session][:password])
      # Set session
      session[:user_id] = user.id
      # Redirect on success
      flash[:notice] = "You have logged in successfully"
      # redirect_to user_path(user)
      # user_path(user) takes you to the user's profile page
      redirect_to home_path
    else
      # Error message on incorrect information
      flash[:alert] = "You have entered incorrect information"
      render 'new', status: :unprocessable_entity
    end
  end

  def new
  end

  def destroy
    session[:user_id] = nil # Setting the user_id to nil logs the user out
    flash[:notice] = "You have logged out"
    redirect_to root_path
  end
end

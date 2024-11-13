class UsersController < ApplicationController
  before_action :requireLogin
  before_action :set_user, only: [:show, :edit, :update]

  def index
    # Display all users in the database
    @users = User.all
  end

  def new
    # Make a new user
    @user = User.new
  end

  def create
    puts params.inspect
    @user = User.new(user_params)
    # If the user information and the user is saved to the database
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You have successfully signed up!"
      redirect_to login_path
    else
      flash[:alert] = "You have entered incorrect information, please try again!"
      render 'new', status: :unprocessable_entity
    end
  end

  def show
    # Find a user by their ID
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "You have successfully changed your account details!"
      redirect_to profile
    end
  end

  def destroy
  end

  def profile
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:email, :username, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end

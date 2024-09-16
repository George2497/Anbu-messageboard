class UsersController < ApplicationController

  def index
    # Display all users in the database
    @users = User.all[params[:user]]
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
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:email, :username, :password)
  end

end
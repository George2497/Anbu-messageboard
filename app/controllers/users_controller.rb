class UsersController < ApplicationController

  def index
    @users = User.all[params[:user]]
  end

  def new
    @user = User.create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end

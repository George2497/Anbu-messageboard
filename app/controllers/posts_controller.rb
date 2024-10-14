class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:successful] = "You have successfully posted a new article!"
      redirect_to @post
    else
      flash[:alert] = "Your post cannot be posted"
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:successful] = "You have successfully edited a post!"
      redirect_to @post
    end
  end

  def show
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description)
  end
end

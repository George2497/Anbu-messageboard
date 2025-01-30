class PostsController < ApplicationController
  before_action :requireLogin
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.includes(:categories).paginate(page: params[:page], per_page: 10)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "You have successfully posted a new article!"
      redirect_to @post
    else
      flash[:alert] = "Your post cannot be posted"
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "You have successfully edited a post!"
      redirect_to @post
    end
  end

  def show
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "You have just deleted a post"
    redirect_to home_path
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, category_ids: [])
  end
end

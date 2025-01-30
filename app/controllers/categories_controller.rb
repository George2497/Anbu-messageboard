class CategoriesController < ApplicationController
  before_action :requireLogin

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "You have successfully created a new category!"
      redirect_to categories_path
    else
      flash[:alert] = "Your category was not created!"
      render 'new', status: :unprocessable_entity
    end
  end

  def show
    @category = Category.find(params[:id])
    @posts = @category.posts.paginate(page: params[:page], per_page: 10)

  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end

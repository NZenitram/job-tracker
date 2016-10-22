class CategoriesController < ApplicationController

  def index
    @category = Category.all
  end
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
    # @job = Job.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    if @category.save
      # flash[:success] = "#{@category.title} updated!"
      redirect_to category_path(@category)
    else
      render :index
    end
  end
  private

  def category_params
    params.require(:category).permit(:title)
  end
end

class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @posts = @category.posts.published.includes(:user)
    @posts = @posts.page(params[:page]) if defined?(Kaminari)
  end
end

class HomeController < ApplicationController
  def index
    @highlights = Post.published.where(featured: true).includes(:user, :category, :likes).limit(3)
    @categories = Category.all
    
    # Handle sorting
    @recent_posts = case params[:sort]
    when 'most_liked'
      Post.published.includes(:user, :category, :likes)
          .left_joins(:likes)
          .group('posts.id')
          .order('COUNT(likes.id) DESC')
          .limit(12)
    when 'oldest'
      Post.published.includes(:user, :category, :likes)
          .order(created_at: :asc)
          .limit(12)
    when 'title_asc'
      Post.published.includes(:user, :category, :likes)
          .order(title: :asc)
          .limit(12)
    when 'title_desc'
      Post.published.includes(:user, :category, :likes)
          .order(title: :desc)
          .limit(12)
    else # 'latest' or default
      Post.published.includes(:user, :category, :likes)
          .order(created_at: :desc)
          .limit(12)
    end
  end
end

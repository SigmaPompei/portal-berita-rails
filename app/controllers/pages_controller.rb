class PagesController < ApplicationController
  def index
    @popular_articles = Article.order(views_count: :desc).limit(3)
    @latest_articles = Article.order(created_at: :desc).limit(3)
  end
end
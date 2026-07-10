class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def index
    @total_articles = Article.count
    @total_users = User.count
    @total_views = Article.sum(:views_count)
    @total_categories = Category.count
    @latest_articles = Article.order(created_at: :desc).limit(5)
    @popular_articles = Article.order(views_count: :desc).limit(5)
  end

  private

  def check_admin
    unless current_user.admin?
      redirect_to root_path, alert: "Akses ditolak! Hanya admin yang bisa masuk."
    end
  end
end
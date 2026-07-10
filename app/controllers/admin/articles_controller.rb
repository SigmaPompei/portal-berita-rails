class Admin::ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def index
    @articles = Article.includes(:user, :category)
                       .order(created_at: :desc)
                       .page(params[:page]).per(10)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to admin_articles_path, notice: "Artikel berhasil dihapus!"
  end

  private

  def check_admin
    unless current_user.admin?
      redirect_to root_path, alert: "Akses ditolak!"
    end
  end
end
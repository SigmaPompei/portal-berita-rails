class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @article = Article.find(params[:article_id])
    @like = @article.likes.new(user: current_user)

    if @like.save
      redirect_to @article, notice: "Artikel disukai! ❤️"
    else
      redirect_to @article, alert: "Kamu sudah like artikel ini!"
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @like = @article.likes.find_by(user: current_user)
    @like&.destroy
    redirect_to @article, notice: "Like dibatalkan!"
  end
end
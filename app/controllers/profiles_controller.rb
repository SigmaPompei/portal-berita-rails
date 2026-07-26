class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @articles = @user.articles
                     .order(created_at: :desc)
                     .page(params[:page])
                     .per(6)
    @total_views = @user.articles.sum(:views_count)
    @total_comments = Comment.joins(:article)
                             .where(articles: { user_id: @user.id })
                             .count
  end
end
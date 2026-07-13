class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:destroy]
  before_action :check_owner, only: [:destroy]

 def create
  @article = Article.find(params[:article_id])
  @comment = @article.comments.new(comment_params)
  @comment.user = current_user

  if @comment.save
    redirect_to @article, notice: "Komentar berhasil ditambahkan!"
  else
    redirect_to @article, alert: "Gagal: #{@comment.errors.full_messages.join(', ')}"
  end
end

  def destroy
    @article = @comment.article
    @comment.destroy
    redirect_to @article, notice: "Komentar berhasil dihapus!"
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def check_owner
    unless @comment.user == current_user || current_user.admin?
      redirect_to @comment.article, alert: "Kamu tidak punya akses!"
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
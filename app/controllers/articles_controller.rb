class ArticlesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]
  # GET /articles
 def index
  @search = params[:search]
  @articles = Article.order(created_at: :desc)

  if @search.present?
    @articles = @articles.where(
      "title LIKE ?", "%#{@search}%"
    )
  end

  @articles = @articles.page(params[:page]).per(6)
end

  # GET /articles/:id
def show
  @article.increment!(:views_count)
end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # POST /articles
  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      redirect_to @article, notice: "Artikel berhasil dibuat!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /articles/:id/edit
  def edit
  end

  # PATCH /articles/:id
  def update
    if @article.update(article_params)
      redirect_to @article, notice: "Artikel berhasil diupdate!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /articles/:id
  def destroy
    @article.destroy
    redirect_to articles_path, notice: "Artikel berhasil dihapus!"
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def check_owner
  unless @article.user == current_user || current_user.admin?
    redirect_to articles_path, alert: "Kamu tidak punya akses!"
  end
end

  def article_params
    params.require(:article).permit(:title, :body, :cover_image, :category_id)
  end
end
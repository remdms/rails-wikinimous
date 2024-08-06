class ArticlesController < ApplicationController
  # before_action :set_article, only: [:update, :edit, :destroy, :show]
  # la ligne ci-dessus remplace les lignes set_article en début de méthode
  def new
    @article = Article.new
  end

  def create
    article = Article.create(article_params)
    redirect_to article_path(article)
  end

  def update
    set_article
    @article.update(article_params)
    redirect_to articles_path
  end

  def edit
    set_article
  end

  def destroy
    set_article
    @article.destroy
    redirect_to articles_path
  end

  def index
    @articles = Article.all
  end

  def show
    set_article
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end

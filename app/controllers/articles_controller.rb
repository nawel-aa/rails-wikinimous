class ArticlesController < ApplicationController
  before_action :find_article, only: %i[edit show update destroy]

  def index
    @articles = Article.all
  end

  def create
    article = Article.create(check_article_params)

    redirect_to article_path(article.id)
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def show
  end

  def update
    Article.update(check_article_params)

    redirect_to article_path(params[:id])
  end

  def destroy
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def check_article_params
    params.require(:article).permit(:title, :content)
  end
end

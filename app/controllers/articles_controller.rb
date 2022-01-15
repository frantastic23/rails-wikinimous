class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    find_article
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_path
  end

  def edit
    find_article
  end

  def update
    find_article
    @task.update(article_params)
    redirect_to articles_path
  end

  def destroy
    find_article
    @task.destroy(article_params)
    redirect_to articles_path
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end

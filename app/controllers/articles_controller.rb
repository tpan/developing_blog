class ArticlesController < ApplicationController
  def index
    # Number of articles to show
    # How many articles per page
    # Ordering of articles to display
    # Which page we're on
    @rate = params[:article_amount] || 5
    @page = params[:page] || 1
    @per_page = @page * @rate - @rate...@page * @rate

    @articles = Article.ordered_articles[@per_page]
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id]) 

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end

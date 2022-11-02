class ArticlesController < ApplicationController
  ARTICLES_PER_PAGE = 5
  def index
    # Number of articles to show
    # How many articles per page
    # Ordering of articles to display

    @page = params.fetch(:page, 0).to_i
    @articles = Article.offset(@page * ARTICLES_PER_PAGE).limit(ARTICLES_PER_PAGE)
    @last_page = Article.all.size / ARTICLES_PER_PAGE
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

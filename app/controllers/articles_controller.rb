class ArticlesController < ApplicationController
  def index
    # Number of articles to show
    # How many articles per page
    # Ordering of articles to display
    @articles_per_page = params.fetch(:articles_per_page, 5).to_i

    @page = params.fetch(:page, 0).to_i
    @pages = (0..(Article.count / @articles_per_page)).to_a
    @articles = Article.offset(@page * @articles_per_page).limit(@articles_per_page)
    @last_page = Article.count / @articles_per_page
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
      params.require(:article).permit(:title, :body, :articles_per_page)
    end
end

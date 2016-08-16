class ArticlesController < ApplicationController

  before_action :authenticate_user!
  def index
    @q = Article.search(params[:q])
    @articles = @q.result.paginate(page: params[:page], per_page: 10)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render "new"
    end
  end

  def edit
    find_article
  end

  def update
    find_article
    if @article.update(article_params)
      redirect_to @article
    else
      render "edit"
    end
  end

  def show
    find_article
    @comment = @article.comments.new
  end

  def destroy
    find_article
    @article.destroy
    redirect_to articles_path
  end

  private
    def find_article
      @article = Article.find(params[:id])
    end
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
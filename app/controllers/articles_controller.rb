class ArticlesController < ApplicationController
  before_filter :find_article, except: [:index, :new, :create]
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
  end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render "edit"
    end
  end

  def show
    @comment = @article.comments.new
  end

  def destroy
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
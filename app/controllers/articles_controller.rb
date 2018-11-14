class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  def new
    @article = Article.new
  end
  def create
    @article = Article.new article_from_parameters
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def show
    @article = Article.find params[:id]
  end

  def destroy
    Article.find(params[:id]).destroy
    render 'index'
  end

  def edit
    @article = Article.find params[:id]
  end

  def update
    @article = Article.find params[:id]

    if @article.update article_from_parameters
      redirect_to @article
    else
      render 'edit'
    end
  end

  private

  def article_from_parameters
    data = params.require :article
    data.permit :title, :text
  end
end

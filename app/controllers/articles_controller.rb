class ArticlesController < ApplicationController
  # allow unauthenitcated access to view-only pages.
  skip_before_action :authenticate_author!, only: [ :index, :show ]

  # Get a list of all articles from the database. This is passed to the index
  # view in the articles folder by magic.
  def index
    @articles = Article.all
  end
  # Same as index
  def new
    @article = Article.new
  end
  # This accepts the data from a "new" page form's submission, and tries to save
  # it to the database. Renders the `show` page for the new article if
  # successful or goes back to the `new` page to try again.
  def create
    @article = Article.new article_from_parameters
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  # This passes the looked-up article to the views/articles/show.html.erb
  # template.
  def show
    @article = Article.find params[:id]
  end

  # deletes the article from the database and goes back to the list of all
  # articles.
  def destroy
    Article.find(params[:id]).destroy
    render 'index'
  end

  # render views/articles/edit to update the given article.
  def edit
    @article = Article.find params[:id]
  end

  # receives form data from the edit view to update the database entry.
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
    data = params.require(:article).permit(:title, :text)
    { title: data[:title], text: data[:text], author: current_author }
  end
end

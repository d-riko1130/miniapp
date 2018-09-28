class ArticlesController < ApplicationController

  before_action :move_to_index, except: [:index, :show]
  before_action :set_article, only: [:destroy, :edit, :update, :show]

  def index
    @articles = Article.includes(:user).page(params[:page]).per(5).order('created_at DESC')
  end

  def new
    @articles = Article.new
  end

  def create
    @articles = Article.create(title: article_params[:title], image: article_params[:image], text: article_params[:text],user_id: current_user.id)
  end

  def destroy
    @article.destroy if user_signed_has
  end

  def edit
  end

  def update
    @article.update(article_params) if user_signed_has
  end

  def show
  end

  private
  def article_params
    params.require(:article).permit(:title, :image, :text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def user_signed_has
    @article.user_id == current_user.id
  end

end

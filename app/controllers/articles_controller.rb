class ArticlesController < ApplicationController
  before_action :authorize
  before_action :set_article, only: [:show, :update, :destroy]
  def index
     @articles = @user.articles.all
     
      if @articles.present?
       render json: @articles, status: :ok

      else
       render json: {message: "not found"}, status: :not_found
      end
   end
   def show
     render json: @article
   end
   
   def create
     @article = Article.new(article_params.merge(user: @user))
     if @article.save
       render json: @article, status: :created
     else
       render json: @article.errors, status: :unprocessable_entity
     end
   end

   def update
     if @article.update(article_params)
       render json: @article
     else
       render json: @article.errors, status: :unprocessable_entity
     end
   end

   def destroy
     @article.destroy
     render json: {message: "Sucessfully destroyed"}, status: :ok
   end

   private
   def set_article
    @article = @user.articles.find_by_id(params[:id])
    unless @article.present?
      render json: {message: "not found"}, status: :not_found
    end

  end
     def article_params
       params.require(:article).permit(:name, :body)
     end
end

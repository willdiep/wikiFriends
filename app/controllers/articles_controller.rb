class ArticlesController < ApplicationController

    def index
        if params[:q] && params[:q] != ""
            Article.search(params[:q])
            @articles =  Article.all.select {|article| article.title.downcase.include?(params[:q].downcase)}
        else
            @articles = Article.all
        end
    end

    def show
        @article = Article.find(params[:id])
        @saved_article = SavedArticle.new
        @article_tag = ArticleTag.new
    end

    def save
        @saved_article = SavedArticle.new()
    end
 
    private

    def article_params
        params.require(:article).permit(:title, :url, :short_desc, saved_article_attribute: [:note, :article_id, :user_id])
    end


end

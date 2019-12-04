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
    end

 
end

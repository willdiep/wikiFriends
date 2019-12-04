class ArticlesController < ApplicationController

    def index
       @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def search
        if params[:q] != ""
            response = RestClient.get("https://en.wikipedia.org/w/api.php?action=opensearch&search=#{params[:q]}&limit=5&format=json")
            results_hash = JSON.parse(response)
            articles = results_hash[1].map { |title| Article.find_or_create_by(title: title) }
            articles.each_with_index do |article, i|
                article.short_desc = results_hash[2][i]
                article.url = results_hash[3][i]
                article.save
            end
            @articles = articles
            render 'index'

        else
            @articles = Article.all
            render 'articles/index'
        end
    end
end

class ArticlesController < ApplicationController

    def index
        if params[:q] && params[:q] != ""
            Article.search(params[:q])
            @articles =  Article.all.select {|article| article.title.downcase.include?(params[:q].downcase)}
        elsif params[:f] && params[:f] != "" && Tag.find_by(name: params[:f])
            @articles = Article.all.select do |article| 
                article.tags.include?(Tag.find_by(name: params[:f]))
            end
        elsif params[:p] == ""
                @articles = Article.all.select {|article| article.users != []}
                @articles = @articles.sort{|article| article.users.length}
        elsif params[:t] == ""
            @articles = Article.all.select {|article| article.tags != []}
            @articles = @articles.sort{|article| article.tags.length }
        else
            @articles = Article.all.sort_by {|article| article.title}
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

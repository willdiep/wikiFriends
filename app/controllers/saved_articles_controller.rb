class SavedArticlesController < ApplicationController

    def create
        @article
        @saved_article = SavedArticle.new(saved_article_params)
        @saved_article.user_id = session[:user_id]
        if @saved_article.valid?
            @saved_article.save
            redirect_to "/articles/#{params[:saved_article][:article_id]}"
        else
            redirect_to "/articles/#{params[:saved_article][:article_id]}"
        end



    end

    private

    def saved_article_params
        params.require(:saved_article).permit(:note, :article_id, :user_id)
    end
end

class ArticleTagsController < ApplicationController
    def create
        if params[:article_tag][:tag][:name] != ""
            @tag = Tag.new(name: params[:article_tag][:tag][:name])
            @article_tag = ArticleTag.new(article_id: params[:article_tag][:article_id])
            if @tag.valid?
                @tag.save
                @article_tag.tag = @tag
                @article_tag.save
                redirect_to Article.find(params[:article_tag][:article_id])
            end
        else
            @article_tag = ArticleTag.create(tag_id: params[:article_tag][:tag_id], article_id: params[:article_tag][:article_id] )
            redirect_to Article.find(params[:article_tag][:article_id])
        end
    end

    private

    def article_tag_params
        params.require(:article_tag).permit(:article_id, :tag_id, tag: [:name])
    end
end

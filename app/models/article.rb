class Article < ApplicationRecord
    has_many :saved_articles
    has_many :users, through: :saved_articles
    has_many :article_tags
    has_many :tags, through: :article_tags
end

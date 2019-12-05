class Article < ApplicationRecord
    has_many :saved_articles
    has_many :users, through: :saved_articles
    has_many :article_tags
    has_many :tags, through: :article_tags

    accepts_nested_attributes_for :saved_articles

    def self.search(search)
        response = RestClient.get("https://en.wikipedia.org/w/api.php?action=opensearch&search=#{search}&limit=10&format=json")
        results_hash = JSON.parse(response)
        articles = results_hash[1].map { |title| Article.find_or_create_by(title: title) }
        articles.each_with_index do |article, i|
            article.short_desc = results_hash[2][i]
            article.url = results_hash[3][i]
            article.save
        end
    end


end

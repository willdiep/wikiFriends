class User < ApplicationRecord
    has_many :saved_articles
    has_many :articles, through: :saved_articles

end

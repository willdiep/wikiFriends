class User < ApplicationRecord
    has_many :saved_articles
    has_many :articles, through: :saved_articles
    validates :username, presence: true
    has_secure_password

end

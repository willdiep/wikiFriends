class ArticleTag < ApplicationRecord
  belongs_to :article_id
  belongs_to :tag_id
end

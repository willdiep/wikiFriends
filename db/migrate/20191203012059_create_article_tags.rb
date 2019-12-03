class CreateArticleTags < ActiveRecord::Migration[6.0]
  def change
    create_table :article_tags do |t|
      t.references :article_id, null: false, foreign_key: true
      t.references :tag_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end

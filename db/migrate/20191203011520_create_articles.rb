class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :url
      t.string :short_desc
      t.string :img_url
      t.string :full_desc

      t.timestamps
    end
  end
end

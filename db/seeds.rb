# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require_relative "../config/environment.rb"


search_query = "test"
response = RestClient.get("https://en.wikipedia.org/w/api.php?action=opensearch&search=#{search_query}&limit=5&format=json
")
results_hash = JSON.parse(response)

articles = results_hash[1].map do |title| Article.new(title: title)
end
articles.each_with_index do |article, i|
    article.short_desc = results_hash[2][i]
    article.url = results_hash[3][i]
    response = RestClient.get("https://en.wikipedia.org/w/api.php?action=query&titles=#{article.title}&format=json&prop=images")
    image_hash = JSON.parse(response)
    byebug
    #image_response = RestClient.get("http://en.wikipedia.org/w/api.php?action=query&titles=#{image_hash[:query][:pages][[:images[0][:title]}&prop=imageinfo&iiprop=url&format=json")
end

puts "hello"


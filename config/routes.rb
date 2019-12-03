Rails.application.routes.draw do
  resources :article_tags
  resources :tags
  resources :saved_articles
  resources :articles
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  root "welcome#home"
  # get "/", to: "welcomes#home"
  resources :articles, only: [:index, :show]
  resources :users, except: :new

  get "/users/:id/my_articles", to: "users#my_articles"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  get "/sessions", to: "sessions#destroy"
  delete "/sessions", to: "sessions#destroy"
  get "/search", to: "articles#index"

  post "/saved_articles", to: "saved_articles#create"
  post "/article_tags", to: "article_tags#create"
  post "/articles/tags", to: "articles#index"
end

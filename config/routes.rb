Rails.application.routes.draw do
  root "welcome#home"
  # get "/", to: "welcomes#home"
  resources :articles, only: [:index, :show]
  resources :users, except: :new

  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  get "/sessions", to: "sessions#destroy"
  delete "/sessions", to: "sessions#destroy"
  get "/search", to: "articles#index"

  get "/saved_articles/:id", to: "saved_articles#show"
  post "/saved_articles", to: "saved_articles#create"
  patch "/saved_articles/:id", to: "saved_articles#update", as: :saved_article
  put "/saved_articles/:id", to: "saved_articles#update"
  post "/article_tags", to: "article_tags#create"

  get "/profile", to: "users#profile"
  delete "/profile", to: "users#delete"

  post "/articles/tags", to: "articles#index"
  delete "/saved_articles/:id", to: "saved_articles#destroy"
end

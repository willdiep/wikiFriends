Rails.application.routes.draw do
  resources :tags
  resources :articles, only: [:index, :show]
  resources :users, except: :new

  root "welcome#home"
  get "/users/:id/my_articles", to: "users#my_articles"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy"
  get "/search", to: "articles#search"

end

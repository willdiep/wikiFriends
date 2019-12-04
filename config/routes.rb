Rails.application.routes.draw do
  root "welcome#home"
  # get "/", to: "welcomes#home"
  resources :tags
  resources :articles, only: [:index, :show]
  resources :users, except: :new

  get "/users/:id/my_articles", to: "users#my_articles"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy"
  get "/search", to: "articles#index"

  patch "/articles/:id", to: "articles#save"

  

end

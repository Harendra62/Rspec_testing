Rails.application.routes.draw do
  # get 'articles/index'
  # get 'articles/show'
  # get 'articles/update'
  # get 'articles/create'
  # get 'article/index'
  # get 'article/show'
  # get 'article/update'
  # get 'article/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :articles
  resources :users
  post "/login", to: "users#login"
end

Rails.application.routes.draw do

  # Main link for the covert
  root 'users#index'

  # get '/users', to: 'users#index'
  # get '/users/:id', to: 'users#show', as: :user
  # get '/users/:user_id/posts', to: 'posts#index', as: :user_posts
  # get '/users/:user_id/posts/:id', to: 'posts#show', as: :user_post

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
end

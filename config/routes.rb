Rails.application.routes.draw do
  
  devise_for :users
  root to: "pages#index"

  get 'auth/:provider/callback' => 'sessions#create'
  # get 'auth/failure' => redirect('/')
  get 'logout' => 'sessions#destroy'

  resources :posts
  resources :categories
  resources :contacts
  resources :comments
  resources :replies

    resources :posts do
      resources :comments
  end

    resources :users do
      resources :posts
  end
end

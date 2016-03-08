Rails.application.routes.draw do
  
  devise_for :users
  root to: "pages#index"
  get 'auth/:provider/callback' => 'sessions#create'
  # get 'auth/failure' => redirect('/')
  get 'logout' => 'sessions#destroy'
  resources :categories
  
  resources :posts do
    resources :comments, module: 'posts' 
  end
end

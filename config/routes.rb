Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  get 'signup' => 'users#new'
  get "signin" => "sessions#new"
  get "signout" => "sessions#destroy"

  resources :users
  root "categories#index"
  resources :categories do
    resources :posts
  end
  
end

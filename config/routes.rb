Rails.application.routes.draw do
  resource :session
  get 'signup' => 'users#new'
  get "signin" => "sessions#new"

  resources :users
  root "categories#index"
  resources :categories do
    resources :posts
  end
  
end

Rails.application.routes.draw do
  resources :users
  root "categories#index"
  resources :categories do
    resources :posts
  end
  
end

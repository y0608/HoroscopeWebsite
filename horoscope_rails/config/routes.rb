Rails.application.routes.draw do
  devise_for :users
  
  resources :posts
  
  resources :users
  
  # resources :posts do
  #   resources :comments
  # end

  root "pages#home"
end

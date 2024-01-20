Rails.application.routes.draw do
  devise_for :users
  
  resources :users do
    member do
      patch 'update_role'
    end
  end

  resources :posts do
    resources :comments
  end

  root "pages#home"
end

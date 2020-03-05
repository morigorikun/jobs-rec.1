Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products do
    resources :contents
    collection do
      get :search
      get :machine_search
    end
  end
  resources :users, only: [:show]
  resources :machines
end

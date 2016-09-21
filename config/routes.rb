Rails.application.routes.draw do
  root 'users#index'
  resources :user_produce
  resources :produce
  devise_for :users
  resources :users, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

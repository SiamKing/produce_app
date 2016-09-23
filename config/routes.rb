Rails.application.routes.draw do
  root 'users#show'
  resources :user_produce
  resources :produce
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:index, :show]
  post 'eaten' => 'users#eaten'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do

  root 'users#show'
  resources :user_produce, :produce, :juice_produce, :juices
  devise_for :users, :controllers => { registrations: 'registrations', :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users do
    resources :juices, only: :index
  end

  resources :produce do
    resources :juices, only: :index
  end

  get 'users/:id/produce/index' => 'produce#index', as: :user_user_produce_index
  post 'eaten' => 'user_produce#eaten'
  get '/welcome' => 'application#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

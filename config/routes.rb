Rails.application.routes.draw do

  root 'application#welcome'
  resources :user_produce, :produce, :juice_produce, :juices, :comments
  devise_for :users, :controllers => { registrations: 'registrations', :omniauth_callbacks => "users/omniauth_callbacks" }
  get '/auth/facebook/callback' => 'sessions#create'
  
  resources :users do
    resources :juices, only: [:index, :new]
  end

  resources :produce do
    resources :juices, only: :index
  end

  get 'users/:id/produce/index' => 'produce#index', as: :user_user_produce_index
  post 'eaten' => 'user_produce#eaten'
  get '/welcome' => 'application#welcome'
  get '*path' => redirect('/')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

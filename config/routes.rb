Rails.application.routes.draw do
  resources :juice_produce
  resources :juices
  root 'users#show'
  resources :user_produce
  resources :produce
  devise_for :users, :controllers => { registrations: 'registrations', :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users do
    resources :juices
  end

  post 'eaten' => 'users#eaten'
  get '/welcome' => 'application#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

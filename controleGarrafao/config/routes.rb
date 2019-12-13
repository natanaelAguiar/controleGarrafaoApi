Rails.application.routes.draw do
  resources :clients
  resources :bottles
  # resources :users, param: :_username
  resources :users, only: [:create, :update]
  post '/auth/login', to: 'authentication#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

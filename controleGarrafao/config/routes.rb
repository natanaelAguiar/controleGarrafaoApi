Rails.application.routes.draw do
  resources :client_bottles
  resources :clients
  resources :bottles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

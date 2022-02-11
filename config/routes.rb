Rails.application.routes.draw do
  resources :send_messages
  resources :parties
  resources :drivers
  root "send_messages#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

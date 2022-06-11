Rails.application.routes.draw do
  root 'flights#index'

  resources :bookings, only: %w[new show create]
  resources :flights, only: %w[index]
  resources :passengers, only: %w[create]
end

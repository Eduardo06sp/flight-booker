Rails.application.routes.draw do
  root 'flights#index'

  resources :bookings, only: %w[new show]

  post 'bookings', to: 'bookings#create'

  post 'passengers', to: 'passengers#create'

  resources :flights, only: %w[index]
end

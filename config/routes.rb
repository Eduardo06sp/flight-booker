Rails.application.routes.draw do
  get 'bookings/new'
  get 'bookings/:id', to: 'bookings#show', as: 'booking'
  post 'bookings', to: 'bookings#create'

  post 'passengers', to: 'passengers#create'

  resources :flights, only: %w[index]

  root 'flights#index'
end

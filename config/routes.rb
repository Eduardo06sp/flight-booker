Rails.application.routes.draw do
  get 'bookings/new'
  get 'bookings/:id', to: 'bookings#show', as: 'booking'
  post 'bookings', to: 'bookings#create'

  get 'flights/index'

  post 'passengers', to: 'passengers#create'

  root 'flights#index'
end

Rails.application.routes.draw do
  get 'bookings/new'
  post 'bookings', to: 'bookings#create'

  get 'flights/index'

  post 'passengers', to: 'passengers#create'

  root 'flights#index'
end

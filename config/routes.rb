Rails.application.routes.draw do
  get 'bookings/new'
  post 'bookings', to: 'bookings#create'

  get 'flights/index'

  root 'flights#index'
end

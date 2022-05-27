Rails.application.routes.draw do
  get 'bookings/new'
  get 'flights/index'

  root 'flights#index'
end

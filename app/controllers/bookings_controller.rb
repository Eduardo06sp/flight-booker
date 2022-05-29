class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @selected_flight = Flight.find(params[:flight_id])
  end

  def create
  end
end

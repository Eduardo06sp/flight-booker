class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @number_of_passengers = params[:passengers].to_i
    @passenger = Passenger.new
    @selected_flight = Flight.find(params[:flight_id])
    @flight_passenger = @selected_flight.passengers.build

    @number_of_passengers.times { @booking.passengers.build }
  end

  def create
  end
end

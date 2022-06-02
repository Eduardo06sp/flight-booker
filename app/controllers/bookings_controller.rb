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
    @booking = Booking.new(passenger_params)

    if @booking.save
      redirect_to @booking
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @selected_flight = @booking.flight
  end

  def passenger_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:first_name, :last_name, :email, :phone_number])
  end
end

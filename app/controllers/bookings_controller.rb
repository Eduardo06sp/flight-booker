class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @number_of_passengers = params[:passengers].to_i
    @selected_flight = Flight.find(params[:flight_id])

    @passenger = Passenger.new
    @number_of_passengers.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(passenger_params)
    @booking.save!
  end

  private

  def passenger_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:first_name, :last_name, :email, :phone_number])
  end
end

class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @number_of_passengers = params[:passengers].to_i
    @selected_flight = Flight.find(params[:flight_id])

    @passenger = Passenger.new
    @number_of_passengers.times { @booking.passengers.build }
  end

  def create
    # @selected_flight = Flight.find(params[:flight_id])
    # @booking = Booking.create(passenger_params)
    # @booking = Booking.create(flight_id: params[:flight_id])
    @booking = Booking.new(passenger_params)
    passenger_params[:passengers_attributes].each do |i, passenger_attributes|
      @booking.passengers[i.to_i].update(passenger_attributes)
      Booking.create(flight_id: @booking.flight_id, passenger_id: @booking.passengers[i.to_i].id)
    end
  end

  private

  def passenger_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:first_name, :last_name, :email, :phone_number])
  end
end

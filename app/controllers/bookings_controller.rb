class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @selected_flight = Flight.find(params[:flight_id])
  end

  def create
    @booking = Booking.new(passenger_params)

    if @booking.save
      redirect_to @booking
    else
      @selected_flight = Flight.find(params[:booking][:flight_id])
      render :new, status: :unprocessable_entity
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

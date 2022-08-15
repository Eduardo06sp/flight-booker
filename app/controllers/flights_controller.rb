class FlightsController < ApplicationController
  def index
    @flights = Flight.all

    if params
      @selected_flights = Flight.where(
        origin_id: params[:origin_id],
        destination_id: params[:destination_id],
        departure_date: params[:departure_date]
      ).where(
        'available_seats >= 1'
      )
    end
  end

  private

  def flight_params
    params.require(:flight).permit(:origin_id, :destination_id, :departure_date, :arrival_time, :available_seats)
  end
end

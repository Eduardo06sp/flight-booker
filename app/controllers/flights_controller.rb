class FlightsController < ApplicationController
  def index
    @flights = Flight.all

    if params[:commit]
      @selected_flights = Flight.where(
        origin_id: params[:flight][:origin_id],
        destination_id: params[:flight][:destination_id],
        departure_date: params[:flight][:departure_date]
      ).where(
        'available_seats >= ?', params[:flight][:available_seats]
      )
    end
  end
end

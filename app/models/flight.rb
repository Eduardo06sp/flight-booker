class Flight < ApplicationRecord
  belongs_to :origin, class_name: 'Airport'
  belongs_to :destination, class_name: 'Airport'

  def departures_formatted
    "#{Flight.first.departure_date.strftime('%m/%d/%y')} - #{departure_time.strftime('%l:%M%p')}"
  end

  def departure_airport
    Airport.find_sole_by id: origin_id
  end

  def arrival_airport
    Airport.find_sole_by id: destination_id
  end
end

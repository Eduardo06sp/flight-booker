class Flight < ApplicationRecord
  belongs_to :origin, class_name: 'Airport'
  belongs_to :destination, class_name: 'Airport'

  scope :unique_departure_dates, -> { select(:departure_date).distinct }

  def departure_dates_formatted
    departure_date.strftime('%m/%d/%y')
  end

  def departure_airport
    Airport.find_sole_by id: origin_id
  end

  def arrival_airport
    Airport.find_sole_by id: destination_id
  end
end

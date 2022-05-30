class Flight < ApplicationRecord
  belongs_to :origin, class_name: 'Airport'
  belongs_to :destination, class_name: 'Airport'

  has_many :bookings
  has_many :passengers, through: :bookings
  accepts_nested_attributes_for :passengers

  scope :unique_departure_dates, -> { select(:departure_date).distinct }

  def departure_date_formatted
    departure_date.strftime('%m/%d/%y')
  end

  def departure_time_formatted
    departure_time.strftime('%I:%M%P')
  end

  def departure_airport
    Airport.find_sole_by id: origin_id
  end

  def arrival_date_formatted
    arrival_date.strftime('%m/%d/%y')
  end

  def arrival_time_formatted
    arrival_time.strftime('%I:%M%P')
  end

  def arrival_airport
    Airport.find_sole_by id: destination_id
  end
end

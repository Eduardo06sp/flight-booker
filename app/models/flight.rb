class Flight < ApplicationRecord
  belongs_to :origin, class_name: 'Airport'
  belongs_to :destination, class_name: 'Airport'

  def departure_airport
    Airport.find_sole_by id: origin_id
  end

  def arrival_airport
    Airport.find_sole_by id: destination_id
  end
end

class Passenger < ApplicationRecord
  has_many :bookings

  validates :first_name, presence: true
end

class Passenger < ApplicationRecord
  has_many :bookings

  validates :first_name, presence: true
  validates :last_name, presence: true
end

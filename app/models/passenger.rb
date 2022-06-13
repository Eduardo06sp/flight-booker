class Passenger < ApplicationRecord
  has_many :bookings

  validates :first_name,
            presence: true,
            length: { maximum: 100 },
            format: { without: /[^A-Za-z ]+/ }
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone_number, presence: true
end

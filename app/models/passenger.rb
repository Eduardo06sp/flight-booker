class Passenger < ApplicationRecord
  has_many :bookings

  validates :first_name,
            :last_name,
            presence: true,
            length: { maximum: 100 },
            format: { without: /[^A-Za-z ]+/ }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone_number, presence: true, format: { with: /\A\(?\d{3}[)-]?\s?\d{3}-?\d{4}\z/ }
end

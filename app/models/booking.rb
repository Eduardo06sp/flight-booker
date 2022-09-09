class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passengers

  accepts_nested_attributes_for :passengers

  after_create :send_confirmation_email

  private

  def send_confirmation_email
    passengers.each do |passenger|
      PassengerMailer.with(
        flight: Flight.find(flight_id),
        passenger:
      ).confirmation_email.deliver_later
    end
  end
end

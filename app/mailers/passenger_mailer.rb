class PassengerMailer < ApplicationMailer
  default from: 'flight@booker.com'

  def confirmation_email
    @selected_flight = params[:selected_flight]
    @passenger = params[:passenger]
    mail(to: @passenger.email, subject: 'Flight Confirmation')
  end
end

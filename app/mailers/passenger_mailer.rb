class PassengerMailer < ApplicationMailer
  default from: 'flight@booker.com'

  def confirmation_email
    @flight = params[:flight]
    @passenger = params[:passenger]
    mail(to: @passenger.email, subject: 'Flight Confirmation')
  end
end

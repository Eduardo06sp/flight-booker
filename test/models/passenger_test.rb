require "test_helper"

class PassengerTest < ActiveSupport::TestCase
  test 'should validate Passenger with no errors' do
    passenger_info = {
      first_name: 'Johnny',
      last_name: 'Bravo',
      email: 'johnny@bra.vo',
      phone_number: '4311000000',
    }
    passenger = Passenger.new(passenger_info)

    assert passenger.valid?
  end
end

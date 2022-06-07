require "test_helper"

class FlightTest < ActiveSupport::TestCase
  test 'should associate Los Angeles airport as origin for first flight' do
    first_flight = flights(:firstflight)
    origin = first_flight.origin
    assert_equal 'LAX', origin.code
  end
end

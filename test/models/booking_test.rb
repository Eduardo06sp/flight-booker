require "test_helper"

class BookingTest < ActiveSupport::TestCase
  test 'should link booking to a flight' do
    first_booking = bookings(:firstbooking)
    first_flight = flights(:firstflight)
    assert_equal first_booking.flight, first_flight
  end
end

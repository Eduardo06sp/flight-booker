require "test_helper"

class AirportTest < ActiveSupport::TestCase
  test 'should associate departing flights to Guadalajara airport' do
    guadalajara_airport = airports(:guadalajaraairport)
    guadalajara_departs = guadalajara_airport.departing_flights
    assert_equal 1, guadalajara_departs.count
  end
end

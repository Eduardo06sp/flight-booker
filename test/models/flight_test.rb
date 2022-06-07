require "test_helper"

class FlightTest < ActiveSupport::TestCase
  test 'should associate Los Angeles airport as origin for first flight' do
    first_flight = flights(:firstflight)
    origin = first_flight.origin
    assert_equal 'LAX', origin.code
  end

  test 'should associate Rio de Janeiro airport as destination for third flight' do
    third_flight = flights(:thirdflight)
    destination = third_flight.destination
    assert_equal 'SDU', destination.code
  end

  test 'should return distinct departure dates' do
    distinct_departing_flights = Flight.all.unique_departure_dates
    distinct_departing_times = distinct_departing_flights.map(&:departure_date)
    assert_equal distinct_departing_times, distinct_departing_times.uniq
  end
end

require "application_system_test_case"

class FlightsTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit flights_url
  #
  #   assert_selector "h1", text: "Flights"
  # end

  test 'viewing search results' do
    visit root_path

    select 'Los Angeles', from: 'origin_id'
    select 'Guadalajara', from: 'destination_id'
    fill_in 'passengers', with: '4'
    select '06/01/22', from: 'departure_date'

    click_on 'commit'

    find('form:nth-child(2)').assert_text 'LAX', count: 2
    find('form:nth-child(2)').assert_text 'Los Angeles', count: 2
    find('form:nth-child(2)').assert_text '06/01/22', count: 4
    find('form:nth-child(2)').assert_text 'GDL', count: 2
    find('form:nth-child(2)').assert_text 'Guadalajara', count: 2

    assert_text '07:00pm', count: 1
    assert_text '08:00pm', count: 1
    assert_text '09:00pm', count: 1
    assert_text '10:00pm', count: 1
  end

  test 'selecting flight result redirects to new Booking path' do

    origin_airport = airports(:losangelesairport).id
    destination_airport = airports(:guadalajaraairport).id
    secondflight = flights(:secondflight).id
    visit "/?origin_id=#{origin_airport}&destination_id=#{destination_airport}&passengers=2&departure_date=2022-06-01&commit=Search+Flights"

    choose("flight_id_#{secondflight}")
    click_on('Select Flight')

    assert_current_path '/bookings/new', ignore_query: true
  end
end

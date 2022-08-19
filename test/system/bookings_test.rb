require "application_system_test_case"

class BookingsTest < ApplicationSystemTestCase
  test 'creating 2-passenger booking' do
    origin_airport = airports(:losangelesairport).id
    destination_airport = airports(:guadalajaraairport).id
    secondflight = flights(:secondflight).id

    visit "bookings/new?flight_id=#{secondflight}&commit=Select+Flight"
    assert_current_path '/bookings/new', ignore_query: true

    first_passenger = {
      field: 'booking_passengers_attributes_0',
      first_name: 'Velma',
      last_name: 'Dinkley',
      email: 'velma@scooby.do',
      phone_number: '1234567890'
    }
    second_passenger = {
      field: 'booking_passengers_attributes_1',
      first_name: 'Daphne',
      last_name: 'Blake',
      email: 'daphne@scooby.do',
      phone_number: '9876543219'
    }

    fill_in "#{first_passenger[:field]}_first_name", with: first_passenger[:first_name]
    fill_in "#{first_passenger[:field]}_last_name", with: first_passenger[:last_name]
    fill_in "#{first_passenger[:field]}_email", with: first_passenger[:email]
    fill_in "#{first_passenger[:field]}_phone_number", with: first_passenger[:phone_number]

    fill_in "#{second_passenger[:field]}_first_name", with: second_passenger[:first_name]
    fill_in "#{second_passenger[:field]}_last_name", with: second_passenger[:last_name]
    fill_in "#{second_passenger[:field]}_email", with: second_passenger[:email]
    fill_in "#{second_passenger[:field]}_phone_number", with: second_passenger[:phone_number]

    click_on('Create Booking')

    within('.flight_result_container') do
      assert_text 'LAX', count: 1
      assert_text 'Los Angeles', count: 1
      assert_text '09:00pm', count: 1

      assert_text '06/01/22', count: 2

      assert_text 'GDL', count: 1
      assert_text 'Guadalajara', count: 1
      assert_text '10:00pm', count: 1
    end

    assert_text first_passenger[:first_name], count: 1
    assert_text first_passenger[:last_name], count: 1
    assert_text first_passenger[:email], count: 1
    assert_text first_passenger[:phone_number], count: 1

    assert_text second_passenger[:first_name], count: 1
    assert_text second_passenger[:last_name], count: 1
    assert_text second_passenger[:email], count: 1
    assert_text second_passenger[:phone_number], count: 1
  end
end

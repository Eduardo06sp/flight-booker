require "application_system_test_case"

class BookingsTest < ApplicationSystemTestCase
  test 'creating 2-passenger booking' do
    secondflight = flights(:secondflight).id

    visit "bookings/new?flight_id=#{secondflight}&commit=Select+Flight"
    assert_current_path '/bookings/new', ignore_query: true

    assert_text 'PASSENGER 1'
    click_on('Add Passenger')
    assert_text 'PASSENGER 2'

    passenger_fields = all('.passenger_fields')
    first_passenger = {
      fields: passenger_fields[0].all('input'),
      first_name: 'Velma',
      last_name: 'Dinkley',
      email: 'velma@scooby.do',
      phone_number: '1234567890'
    }
    second_passenger = {
      fields: passenger_fields[1].all('input'),
      first_name: 'Daphne',
      last_name: 'Blake',
      email: 'daphne@scooby.do',
      phone_number: '9876543219'
    }

    within first_passenger[:fields][0] do
      fill_in with: first_passenger[:first_name]
    end

    within first_passenger[:fields][1] do
      fill_in with: first_passenger[:last_name]
    end

    within first_passenger[:fields][2] do
      fill_in with: first_passenger[:email]
    end

    within first_passenger[:fields][3] do
      fill_in with: first_passenger[:phone_number]
    end

    within second_passenger[:fields][0] do
      fill_in with: second_passenger[:first_name]
    end

    within second_passenger[:fields][1] do
      fill_in with: second_passenger[:last_name]
    end

    within second_passenger[:fields][2] do
      fill_in with: second_passenger[:email]
    end

    within second_passenger[:fields][3] do
      fill_in with: second_passenger[:phone_number]
    end

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

  test 'creating 1-passenger booking after adding and removing passenger fields' do
    fourthflight = flights(:fourthflight).id

    visit "bookings/new?flight_id=#{fourthflight}&commit=Select+Flight"
    assert_current_path '/bookings/new', ignore_query: true

    # load one set of fields upon loading
    # with removal button disabled
    assert_text 'PASSENGER 1'
    assert_selector '.remove_passenger_button.disabled'
    assert_selector 'input', count: 5

    # adding new fields
    # ensuring that no buttons are disabled
    # adding new passengers is disabled when max passengers are added
    click_on 'Add Passenger'
    assert_text 'PASSENGER 2'
    assert_selector 'input', count: 9

    assert_no_selector '.remove_passenger_button.disabled'

    assert_selector '.add_passenger_button:disabled'

    # removing a field
    # cancelling will not affect any fields
    # accepting will actually remove the fields
    removal_buttons = all('.remove_passenger_button')

    confirmation = dismiss_confirm do
      removal_buttons[0].click
    end

    assert_equal confirmation, 'Are you sure you want to delete Passenger 1?'

    accept_confirm do
      removal_buttons[0].click
    end

    assert_selector 'input', count: 5

    # on last set of fields,
    # remove button should be disabled
    # should not let you remove the last field
    assert_selector '.remove_passenger_button.disabled'
    find('.remove_passenger_button').click
    assert_selector 'input', count: 5
  end
end

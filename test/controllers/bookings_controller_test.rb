require "test_helper"

class BookingsControllerTest < ActionDispatch::IntegrationTest

  test 'should route to Bookings new controller' do
    assert_routing '/bookings/new', controller: 'bookings', action: 'new'
  end

  test 'should display new bookings view with selected flight' do
    get bookings_new_path, params: {
      flight_id: flights(:fourthflight).id,
      passengers: '2',
      commit: 'Save '
    }
    assert_response :success

    assert_select '.departure_result_info p:nth-child(2)', text: 'SDU', count: 1
    assert_select '.arrival_result_info p:nth-child(2)', text: 'LAX', count: 1
  end

  test 'should display 8 passenger inputs for 2 passengers' do
    get bookings_new_path, params: {
      flight_id: flights(:fourthflight).id,
      passengers: '2',
      commit: 'Save '
    }
    assert_response :success

    assert_select 'label + input', 8
  end

  test 'should display 4 passenger inputs for 1 passenger' do
    get bookings_new_path, params: {
      flight_id: flights(:fourthflight).id,
      passengers: '1',
      commit: 'Save '
    }
    assert_response :success

    assert_select 'label + input', 4
  end
end

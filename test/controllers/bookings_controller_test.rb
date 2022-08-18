require "test_helper"

class BookingsControllerTest < ActionDispatch::IntegrationTest
  test 'should route to Bookings new controller' do
    assert_routing '/bookings/new', controller: 'bookings', action: 'new'
  end

  test 'shoud route to Bookings show controller' do
    assert_routing '/bookings/:id', controller: 'bookings', action: 'show', id: ':id'
  end

  test 'should route to Bookings create controller' do
    assert_routing({ path: '/bookings', method: 'post' }, { controller: 'bookings', action: 'create' })
  end

  test 'should display new bookings view with selected flight' do
    get new_booking_path, params: {
      flight_id: flights(:fourthflight).id,
      commit: 'Save '
    }
    assert_response :success

    assert_select '.departure_result_info p:nth-child(2)', text: 'SDU', count: 1
    assert_select '.arrival_result_info p:nth-child(2)', text: 'LAX', count: 1
  end

  test 'should display 4 passenger inputs for 1 passenger' do
    get new_booking_path, params: {
      flight_id: flights(:fourthflight).id,
      commit: 'Save '
    }
    assert_response :success

    assert_select 'label + input', 4
  end
end

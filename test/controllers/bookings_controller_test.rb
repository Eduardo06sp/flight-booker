require "test_helper"

class BookingsControllerTest < ActionDispatch::IntegrationTest
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
end

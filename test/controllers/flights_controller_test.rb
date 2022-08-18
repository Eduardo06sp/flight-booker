require "test_helper"

class FlightsControllerTest < ActionDispatch::IntegrationTest
  test 'should route to Flights index' do
    assert_generates '/', controller: 'flights', action: 'index'
    assert_recognizes({ controller: 'flights', action: 'index' }, '/flights')
  end

  test 'should display thirdflight' do
    get flights_path, params: {
      origin_id: airports(:guadalajaraairport).id,
      destination_id: airports(:riodejaneiroairport).id,
      departure_date: '2022-06-01',
      commit: 'Search Flights'
    }
    assert_response :success

    assert_select '.departure_result_info p:nth-child(2)', text: 'GDL', count: 1
    assert_select '.arrival_result_info p:nth-child(2)', text: 'SDU', count: 1
  end

  test 'should not display search results without parameters' do
    get flights_path
    assert_response :success

    assert_select '.arrival_result_info', false
  end

  test 'should not display fifthflight without enough available seats' do
    get flights_path, params: {
      origin_id: airports(:losangelesairport).id,
      destination_id: airports(:guadalajaraairport).id,
      departure_date: '2022-06-02',
      commit: 'Search Flights'
    }
    assert_response :success

    assert_select '.flight_result_container', false
  end
end

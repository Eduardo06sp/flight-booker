require "test_helper"

class FlightsControllerTest < ActionDispatch::IntegrationTest
  test 'should route to Flights index' do
    assert_routing '/flights', controller: 'flights', action: 'index'
  end
end

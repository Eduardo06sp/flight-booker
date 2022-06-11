require "test_helper"

class PassengersControllerTest < ActionDispatch::IntegrationTest
  test 'should route to Passengers create controller' do
    assert_routing({ path: '/passengers', method: 'post' }, { controller: 'passengers', action: 'create' })
  end
end

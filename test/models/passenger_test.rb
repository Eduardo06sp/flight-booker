require "test_helper"

class PassengerTest < ActiveSupport::TestCase
  test 'should validate Passenger with no errors' do
    passenger_info = {
      first_name: 'Johnny',
      last_name: 'Bravo',
      email: 'johnny@bra.vo',
      phone_number: '4311000000'
    }
    passenger = Passenger.new(passenger_info)

    assert passenger.valid?
  end

  test 'should be invalid without first name' do
    passenger = Passenger.new
    assert_not passenger.valid?
    assert_not_empty passenger.errors[:first_name]
  end

  test 'should be invalid with first name longer than 100 characters' do
    invalid_first_name = 'a' * 101
    passenger = Passenger.new(first_name: invalid_first_name)

    assert_not passenger.valid?
    assert_not_empty passenger.errors[:first_name]
  end

  test 'should be invalid with nonalphabetic characters' do
    invalid_first_name = 'Eduard0'
    passenger = Passenger.new(first_name: invalid_first_name)

    assert_not passenger.valid?
    assert_not_empty passenger.errors[:first_name]
  end

  test 'should be invalid without last name' do
    passenger = Passenger.new
    assert_not passenger.valid?
    assert_not_empty passenger.errors[:last_name]
  end

  test 'should be invalid with last name longer than 100 characters' do
    invalid_last_name = 'a' * 101
    passenger = Passenger.new(last_name: invalid_last_name)

    assert_not passenger.valid?
    assert_not_empty passenger.errors[:last_name]
  end

  test 'should be invalid with nonalphabetic characters in last name' do
    invalid_last_name = 'Sabr!na'
    passenger = Passenger.new(last_name: invalid_last_name)

    assert_not passenger.valid?
    assert_not_empty passenger.errors[:last_name]
  end

  test 'should be invalid without email' do
    passenger = Passenger.new
    assert_not passenger.valid?
    assert_not_empty passenger.errors[:email]
  end

  test 'should accept properly formatted email' do
    valid_email = 'test@example.com'
    passenger = Passenger.new(email: valid_email)

    passenger.valid?
    assert_empty passenger.errors[:email]
  end

  test 'should be invalid without properly foratted email' do
    invalid_email = 'testtestco.com'
    passenger = Passenger.new(email: invalid_email)

    assert_not passenger.valid?
    assert_not_empty passenger.errors[:email]
  end

  test 'should be invalid without phone number' do
    passenger = Passenger.new
    assert_not passenger.valid?
    assert_not_empty passenger.errors[:phone_number]
  end
end

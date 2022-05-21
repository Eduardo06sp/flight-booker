# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Flight.delete_all
Airport.delete_all

Airport.create(
  [{
    name: 'Los Angeles',
    code: 'LAX'
  }, {
    name: 'Guadalajara',
    code: 'GDL'
  }, {
    name: 'Rio de Janeiro',
    code: 'SDU'
  }, {
    name: 'Rome',
    code: 'FCO'
  }]
)

Flight.create(
  [{
    departure_time: Time.new(2022, 6, 1, 12, 0, 0, '-07:00'),
    arrival_time: Time.new(2022, 6, 1, 15, 0, 0, '-05:00'),
    origin_id: 1,
    destination_id: 2
  }, {
    departure_time: Time.new(2022, 6, 1, 14, 0, 0, '-05:00'),
    arrival_time: Time.new(2022, 6, 1, 17, 0, 0, '-03:00'),
    origin_id: 2,
    destination_id: 3
  }, {
    departure_time: Time.new(2022, 6, 1, 16, 0, 0, '-03:00'),
    arrival_time: Time.new(2022, 6, 1, 22, 0, 0, '+02:00'),
    origin_id: 3,
    destination_id: 4
  }, {
    departure_time: Time.new(2022, 6, 1, 18, 0, 0, '+02:00'),
    arrival_time: Time.new(2022, 6, 1, 12, 0, 0, '-05:00'),
    origin_id: 4,
    destination_id: 2
  }]
)

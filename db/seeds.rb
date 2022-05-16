# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
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

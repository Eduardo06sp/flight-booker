class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.date :departure_date
      t.time :departure_time
      t.date :arrival_date
      t.time :arrival_time
      t.integer :available_seats
      t.integer :capacity
      t.string :flight_duration

      t.timestamps
    end
  end
end

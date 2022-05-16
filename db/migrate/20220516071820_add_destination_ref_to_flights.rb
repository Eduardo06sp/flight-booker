class AddDestinationRefToFlights < ActiveRecord::Migration[7.0]
  def change
    add_reference :flights, :destination, null: false, foreign_key: { to_table: :airports }
  end
end

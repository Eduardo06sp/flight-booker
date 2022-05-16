class AddOriginRefToFlights < ActiveRecord::Migration[7.0]
  def change
    add_reference :flights, :origin, null: false, foreign_key: { to_table: :airports }
  end
end

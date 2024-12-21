class CreateSpotsBooking < ActiveRecord::Migration[8.0]
  create_table :spots_bookings do |t|
    t.references :booking, foreign_key: true
    t.references :spot, foreign_key: true
    t.timestamps
  end
end

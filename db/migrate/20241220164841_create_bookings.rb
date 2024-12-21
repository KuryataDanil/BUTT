class CreateBookings < ActiveRecord::Migration[8.0]
  create_table :bookings do |t|
    t.references :space, foreign_key: true
    t.references :user, foreign_key: true
    t.datetime :start_time
    t.datetime :end_time
    t.string :status
    t.decimal :price, precision: 10, scale: 2
    t.timestamps
  end
end

class CreateSpots < ActiveRecord::Migration[8.0]
  create_table :spots do |t|
    t.references :space, foreign_key: true
    t.float :x
    t.float :y
    t.integer :size
    t.integer :num
    t.decimal :price, precision: 10, scale: 2
    t.integer :time
    t.string :time_measure
    t.timestamps
  end
end

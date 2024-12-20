class CreateSpaces < ActiveRecord::Migration[8.0]
  create_table :spaces do |t|
    t.string :name
    t.text :description
    t.datetime :opening_time
    t.datetime :closing_time
    t.references :creator, foreign_key: { to_table: :users }
    t.timestamps
  end
end

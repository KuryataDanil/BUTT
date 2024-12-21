class CreateSpaceObjects < ActiveRecord::Migration[8.0]
  def change
    create_table :space_objects do |t|
      t.references :space, foreign_key: true
      t.float :x
      t.float :y
      t.float :size_x
      t.float :size_y
      t.float :angle
      t.timestamps
    end
  end
end

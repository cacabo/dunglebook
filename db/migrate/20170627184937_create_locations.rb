class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.references :dungle, foreign_key: true
      t.string :title
      t.string :address
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end

class CreateDungles < ActiveRecord::Migration[5.1]
  def change
    create_table :dungles do |t|
      t.references :user, foreign_key: true
      t.string :description
      t.integer :performance
      t.integer :ambience
      t.integer :scent
      t.integer :cleanliness
      t.integer :traffic

      t.timestamps
    end
  end
end

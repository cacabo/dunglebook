class AddLocationInformationToDungle < ActiveRecord::Migration[5.1]
  def change
    add_column :dungles, :location_title, :string
    add_column :dungles, :address, :string
    add_column :dungles, :longitude, :float
    add_column :dungles, :latitude, :float
  end
end

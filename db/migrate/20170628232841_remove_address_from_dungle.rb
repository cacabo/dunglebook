class RemoveAddressFromDungle < ActiveRecord::Migration[5.1]
  def change
    remove_column :dungles, :address, :string
  end
end

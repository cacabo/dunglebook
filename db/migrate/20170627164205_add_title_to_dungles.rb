class AddTitleToDungles < ActiveRecord::Migration[5.1]
  def change
    add_column :dungles, :title, :string
  end
end

class AddImageToFarms < ActiveRecord::Migration
  def change
    add_column :farms, :image, :string
  end
end

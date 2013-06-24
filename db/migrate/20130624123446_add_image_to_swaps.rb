class AddImageToSwaps < ActiveRecord::Migration
  def change
    add_column :swaps, :image, :string
  end
end

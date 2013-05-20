class AddDistanceDummyToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :distance, :integer
  end
end

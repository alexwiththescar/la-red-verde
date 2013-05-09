class AddFarmpicFieldsToFarms < ActiveRecord::Migration
  def change
  	add_column :farms, :farmpic_file_name, :string
  	add_column :farms, :farmpic_content_type, :string
  	
  	add_column :farms, :farmpic_file_size, :float
  	add_column :farms, :farmpic_updated_at, :datetime
  end
end

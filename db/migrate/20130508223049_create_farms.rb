class CreateFarms < ActiveRecord::Migration
  def change
    create_table :farms do |t|
      t.string :name
      t.integer :user_id
      t.string :description
      t.string :street_name
      t.string :bldg_name
      t.string :region
      t.integer :post_code
      t.string :province
      t.integer :contact_number
      t.string :products
      t.string :pic_file_name
      t.string :pic_content_type
      t.float :pic_file_size
      t.datetime :pic_updated_at
      t.float :longitude
      t.float :latitude
      t.boolean :organic
      t.boolean :deliver
      t.boolean :swap
      t.boolean :delta, :default => true, :null => false

      t.timestamps
    end
  end
end

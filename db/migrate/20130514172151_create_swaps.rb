class CreateSwaps < ActiveRecord::Migration
  def change
    create_table :swaps do |t|
      t.string :name
      t.string :plant_type
      t.string :description
      t.integer :user_id
       t.string :swap_file_name
      t.string :swap_content_type
      t.float :swap_file_size
      t.datetime :swap_updated_at

      t.timestamps
    end
  end
end

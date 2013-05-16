class CreateSwaps < ActiveRecord::Migration
  def change
    create_table :swaps do |t|
      t.string :name
      t.string :plant_type
      t.string :description
      t.integer :user_id
       t.string :swappic_file_name
      t.string :swappic_content_type
      t.float :swappic_file_size
      t.datetime :swappic_updated_at

      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :description

      t.string :password_digest
      t.string :remember_token
      t.boolean :admin,:default => true
      t.string :avatar
      t.string :street_name
      t.string :bldg_name
      t.string :region
      t.integer :post_code
      t.string :province
      t.integer :contact_number
       t.float :longitude
      t.float :latitude

       t.boolean :delta, :default => true, :null => false


      t.timestamps
    end
  end
end
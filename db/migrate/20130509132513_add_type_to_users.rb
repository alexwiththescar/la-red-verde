class AddTypeToUsers < ActiveRecord::Migration
  def change
  	add_column :farms, :farmtype, :string
  end
end

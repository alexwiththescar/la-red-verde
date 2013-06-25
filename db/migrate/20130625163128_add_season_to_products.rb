class AddSeasonToProducts < ActiveRecord::Migration
  def change
    add_column :products, :avail_from, :date
    add_column :products, :avail_until, :date
  end
end

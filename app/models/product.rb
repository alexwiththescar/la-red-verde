class Product < ActiveRecord::Base
  attr_accessible :description, :farm_id, :name
  belongs_to :farm
end

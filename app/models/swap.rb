class Swap < ActiveRecord::Base
  attr_accessible :description, :name, :plant_type
  belongs_to :user
end

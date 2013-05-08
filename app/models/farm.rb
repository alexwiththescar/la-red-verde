class Farm < ActiveRecord::Base
  attr_accessible :content, :name, :user_id
  belongs_to :user
  has_many :products
end

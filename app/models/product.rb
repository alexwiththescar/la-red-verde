class Product < ActiveRecord::Base
  attr_accessible :description, :farm_id, :name
  belongs_to :farm
end
# == Schema Information
#
# Table name: products
#
#  id               :integer(4)      not null, primary key
#  name             :string(255)
#  description      :string(255)
#  farm_id          :integer(4)
#  ammount          :integer(10)
#  price            :integer(10)
#  category         :string(255)
#  pic_file_name    :string(255)
#  pic_content_type :string(255)
#  pic_file_size    :float
#  pic_updated_at   :datetime
#  longitude        :float
#  latitude         :float
#  delta            :boolean(1)      default(TRUE), not null
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#


class Product < ActiveRecord::Base
  attr_accessible :description, :farm_id, :name, :ammount, :price, :category, :pic, :longitude, :latitude
  belongs_to :farm

include PgSearch
  multisearchable :against => [:name, :description]
  
  def self.search(query)
  if query.present?
    search(query)
  else
    scoped
  end
end

has_attached_file :pic, :styles => { :medium => "300x300>", :thumb => "150x150>", :large => "500x500>" },
                  :url  => "/assets/products/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

#validates_attachment_presence :pic
#validates_attachment_size :pic, :less_than => 5.megabytes
#validates_attachment_content_type :pic, :content_type => ['image/jpeg', 'image/png']




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


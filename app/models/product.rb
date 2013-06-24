class Product < ActiveRecord::Base
  attr_accessible :description, :farm_id, :name, :ammount, :price, :category, :pic, :longitude, 
  :latitude, :image

  belongs_to :farm

 mount_uploader :image, ImageUploader

def self.search(query)
  if query.present?
    search(query)
  else
    scoped
  end
end

def self.get_products(params)
  conditions = ['']
  conditions = ['product = ?', params[:swap]] if params[:swap]
  self.where(conditions)
end

# has_attached_file :pic, :styles => { :medium => "300x300>", :thumb => "150x150>", :large => "500x500>" },
#                   :url  => "/assets/products/:id/:style/:basename.:extension",
#                   :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension",
#                   :default_url => "/images/thumb/missing.png"

#validates_attachment_presence :pic
#validates_attachment_size :pic, :less_than => 5.megabytes
#validates_attachment_content_type :pic, :content_type => ['image/jpeg', 'image/png']




end
# == Schema Information
#
# Table name: products
#
#  id               :integer         not null, primary key
#  name             :string(255)
#  description      :string(255)
#  farm_id          :integer
#  ammount          :decimal(, )
#  price            :decimal(, )
#  category         :string(255)
#  pic_file_name    :string(255)
#  pic_content_type :string(255)
#  pic_file_size    :float
#  pic_updated_at   :datetime
#  longitude        :float
#  latitude         :float
#  delta            :boolean         default(TRUE), not null
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#  distance         :integer
#


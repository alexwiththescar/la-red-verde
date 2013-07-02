class Farm < ActiveRecord::Base
  
  attr_accessible :content, :name, :user_id, :description, :street_name, :bldg_name, :region, :post_code, 
  						:province, :contact_number, :swap, :organic, :farmtype, :deliver, :image, :products_attributes
  

  belongs_to :user
  has_many :products, :dependent => :destroy, :order => "created_at DESC"
 acts_as_followable
  validates :user_id, presence: true
accepts_nested_attributes_for :products
  mount_uploader :image, ImageUploader


geocoded_by :address
  before_save :geocode

def address
[street_name, bldg_name, region, province].compact.join(', ')
end

end
# == Schema Information
#
# Table name: farms
#
#  id                   :integer(4)      not null, primary key
#  name                 :string(255)
#  user_id              :integer(4)
#  description          :string(255)
#  street_name          :string(255)
#  bldg_name            :string(255)
#  region               :string(255)
#  post_code            :integer(4)
#  province             :string(255)
#  contact_number       :integer(4)
#  products             :string(255)
#  pic_file_name        :string(255)
#  pic_content_type     :string(255)
#  pic_file_size        :float
#  pic_updated_at       :datetime
#  longitude            :float
#  latitude             :float
#  organic              :boolean(1)
#  deliver              :boolean(1)
#  swap                 :boolean(1)
#  delta                :boolean(1)      default(TRUE), not null
#  created_at           :datetime        not null
#  updated_at           :datetime        not null
#  farmtype             :string(255)
#  farmpic_file_name    :string(255)
#  farmpic_content_type :string(255)
#  farmpic_file_size    :float
#  farmpic_updated_at   :datetime
#


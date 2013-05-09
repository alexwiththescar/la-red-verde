class Farm < ActiveRecord::Base
  attr_accessible :content, :name, :user_id, :description, :street_name, :bldg_name, :region, :post_code, 
  						:province, :contact_number, :farmtype, :swap, :organic, :deliver, :farmpic
  belongs_to :user
  has_many :products

  validates :user_id, presence: true

  has_attached_file :farmpic, :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
  		:url  => "/assets/farms/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/farms/:id/:style/:basename.:extension"

end
# == Schema Information
#
# Table name: farms
#
#  id               :integer(4)      not null, primary key
#  name             :string(255)
#  user_id          :integer(4)
#  description      :string(255)
#  street_name      :string(255)
#  bldg_name        :string(255)
#  region           :string(255)
#  post_code        :integer(4)
#  province         :string(255)
#  contact_number   :integer(4)
#  products         :string(255)
#  pic_file_name    :string(255)
#  pic_content_type :string(255)
#  pic_file_size    :float
#  pic_updated_at   :datetime
#  longitude        :float
#  latitude         :float
#  organic          :boolean(1)
#  deliver          :boolean(1)
#  swap             :boolean(1)
#  delta            :boolean(1)      default(TRUE), not null
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#  type             :string(255)
#


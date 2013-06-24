class Swap < ActiveRecord::Base
  attr_accessible :description, :name, :plant_type, :swap_file_name, :swap_content_type,
   :swap_file_size, :swap_updated_at, :image
  belongs_to :user

mount_uploader :image, ImageUploader
# has_attached_file :swappic, :styles => { :medium => "300x300>", :thumb => "150x150>", :large => "500x500>" }, 
#   		:url  => "/assets/swaps/:id/:style/:basename.:extension",
#                   :path => ":rails_root/public/assets/swaps/:id/:style/:basename.:extension",
#                   :default_url => "/images/thumb/missing.png"

end
# == Schema Information
#
# Table name: swaps
#
#  id                   :integer(4)      not null, primary key
#  name                 :string(255)
#  plant_type           :string(255)
#  description          :string(255)
#  user_id              :integer(4)
#  swappic_file_name    :string(255)
#  swappic_content_type :string(255)
#  swappic_file_size    :float
#  swappic_updated_at   :datetime
#  created_at           :datetime        not null
#  updated_at           :datetime        not null
#


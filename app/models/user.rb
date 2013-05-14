class User < ActiveRecord::Base
  attr_accessible :email, :name, :region, :password, :password_confirmation, :description, :avatar, :street_name, :bldg_name, :post_code, :province, :contact_number
  has_many :farms
  has_secure_password

#attr_accessor :avatar_file_name, :avatar_file_size, :avatar_content_type


has_attached_file :avatar, :styles => { :thumb => "75x75>", :medium => "200x200>" },
                  :url  => "/assets/users/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension"

  #validates_attachment_presence :avatar
  
  validates_attachment_size :avatar, :less_than => 5.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']
  
  geocoded_by :address
  after_validation :geocode, :if => :region_changed?

  before_save { email.downcase! }
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
   #                 uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true


def address
[street_name, bldg_name, region, province].compact.join(', ')
end

private
def create_remember_token
self.remember_token = SecureRandom.urlsafe_base64
end
end
# == Schema Information
#
# Table name: users
#
#  id              :integer(4)      not null, primary key
#  name            :string(255)
#  email           :string(255)
#  description     :string(255)
#  password_digest :string(255)
#  remember_token  :string(255)
#  admin           :boolean(1)      default(TRUE)
#  avatar          :string(255)
#  street_name     :string(255)
#  bldg_name       :string(255)
#  region          :string(255)
#  post_code       :integer(4)
#  province        :string(255)
#  contact_number  :integer(4)
#  longitude       :float
#  latitude        :float
#  delta           :boolean(1)      default(TRUE), not null
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#


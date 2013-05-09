class User < ActiveRecord::Base
  attr_accessible :email, :name, :region, :password, :password_confirmation
  has_many :farms
  has_secure_password

before_save { |user| user.email = email.downcase }
before_save :create_remember_token

has_attached_file :avatar, :styles => { :thumb => "75x75>" },
                  :url  => "/assets/products/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

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


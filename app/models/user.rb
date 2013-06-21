class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :region, :description, :avatar, :street_name, :bldg_name, :post_code, :province, :contact_number

  # attr_accessible :title, :body

  acts_as_follower

  has_many :farms
  has_many :swaps
  

  has_private_messages
#attr_accessor :avatar_file_name, :avatar_file_size, :avatar_content_type


has_attached_file :avatar, :styles => { :thumb => "75x75>", :medium => "200x200>" },
                  :url  => "/assets/users/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension"

  #validates_attachment_presence :avatar
  
  validates_attachment_size :avatar, :less_than => 5.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']
  
  geocoded_by :address
  after_validation :geocode, :if => :region_changed?


  def feed
Product.from_farms_followed_by(self)
end

def address
[street_name, bldg_name, region, province].compact.join(', ')
end
end
# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(255)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  authentication_token   :string(255)
#  name                   :string(255)
#  description            :string(255)
#  admin                  :boolean         default(TRUE)
#  avatar                 :string(255)
#  street_name            :string(255)
#  bldg_name              :string(255)
#  region                 :string(255)
#  post_code              :integer
#  province               :string(255)
#  contact_number         :integer
#  longitude              :float
#  latitude               :float
#  delta                  :boolean         default(TRUE), not null
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :float
#  avatar_updated_at      :datetime
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#


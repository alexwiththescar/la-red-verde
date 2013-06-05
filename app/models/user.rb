class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
          :rememberable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :region, :description, :avatar, :street_name, :bldg_name, :post_code, :province, :contact_number

  # attr_accessible :title, :body

  acts_as_follower

  has_many :farms
  has_many :swaps
  

   acts_as_follower
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

class StaticPagesController < ApplicationController
  def home
  	
if signed_in?
    @productsfolling = User.find(current_user).following_farms.includes(:products).collect{|u| u.products}.flatten.last(5)
    @productsfollingcount = User.find(current_user).following_farms.includes(:products).collect{|u| u.products}.flatten

    @products = Product.all.last(5)
    @productcount = Product.all
  end
end

  def farm_map
@json = Farm.all.to_gmaps4rails do |farm, marker|
    marker.infowindow render_to_string(:partial => "infowindow", :locals => { :farm => farm})
    marker.title "#{farm.name}"
  end
end


def help
  end


 def i_am_following
  @following = current_user.all_following
 end

def followed_products
    @products = User.find(current_user).following_farms.includes(:products).collect{|u| u.products}.flatten
  

  end

  def welcome
  end

   def search
  end

private
def signed_in_user
unless signed_in?

redirect_to signin_path, notice: "Please sign in."
end
end

def current_user?(user)
  user == current_user
end
  
def correct_user
@user = User.find(params[:id])
redirect_to(root_path) unless current_user?(@user)
end

def admin_user
redirect_to(root_path) unless current_user.admin?
end
end

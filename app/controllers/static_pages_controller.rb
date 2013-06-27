class StaticPagesController < ApplicationController
  def home
  	
if signed_in?
    productsfoll = User.find(current_user).following_farms.includes(:products).collect{|u| u.products}.flatten
    @productsfollow = productsfoll.paginate(:page => params[:page], :per_page => 30)
  end
end

  def help
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

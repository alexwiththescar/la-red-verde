class StaticPagesController < ApplicationController
  def home
  	
end

  def help
  end

  def about
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

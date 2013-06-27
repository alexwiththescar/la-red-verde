class ApplicationController < ActionController::Base
  protect_from_forgery

    include SessionsHelper

redirect_to ((current_user.sign_in_count == 0) ? "google.com" : "google.com" )   

  
end

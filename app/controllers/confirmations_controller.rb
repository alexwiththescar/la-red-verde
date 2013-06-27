class ConfirmationsController < Devise::ConfirmationsController
  protected
    def after_confirmation_path_for(resource_name, resource)
      if resource.sign_in_count == 1
      	welcome_path
      else
      root_path
  end
end

end
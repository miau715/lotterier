class ApplicationController < ActionController::Base
  protect_from_forgery
  
  layout :layout_by_resource

  def require_is_admin
    unless (current_user && current_user.is_admin?)
      redirect_to root_path
    end
  end

  protected
  def layout_by_resource
    if devise_controller?
      "devise_layout"
    else
      "application"
    end
  end
end

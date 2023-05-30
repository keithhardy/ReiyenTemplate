class ApplicationController < ActionController::Base
    helper_method :current_user

    private
  
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def authorize(*roles)
      # Assuming you have a current_user method that returns the current user object
      user = current_user
    
      # Check if the user is logged in
      unless user
        redirect_to new_session_path, alert: "Please log in to access this page."
        return
      end
    
      # Check if the user has any of the specified roles
      if roles.any? { |role| user.has_role?(role) }
        # User has one of the specified roles, allow access
        return true
      else
        redirect_to users_path, alert: "You are not authorized to access this page."
        return false
      end
    end
end

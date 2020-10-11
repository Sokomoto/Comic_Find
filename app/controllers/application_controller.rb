class ApplicationController < ActionController::Base
	before_action :authenticate_user!, except: [:top]
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def after_sign_in_path_for(resource)
	    case resource
	    when User
	      root_path
	    when Admin
	      admin_path
	    end
  	end

  	def after_sign_out_path_for(resource)
	    case resource
	    when User
	      root_path
	    when Admin
	      new_admin_session_path
	    end
  	end

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  	end
end

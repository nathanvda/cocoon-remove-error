class ApplicationController < ActionController::Base

	before_filter :configure_permitted_parameters, if: :devise_controller?

	protect_from_forgery with: :exception

	layout :layout_by_resource

	protected

	# rescue_from CanCan::AccessDenied do |exception|
	# 	redirect_to root_url, :alert => exception.message
	# end

	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :remember_me, :phone) }
		devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:name, :email, :password, :remember_me) }
		devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password, :phone) }
	end

	def layout_by_resource
		if devise_controller?
			"devise"
		else
			"application"
		end
	end

end

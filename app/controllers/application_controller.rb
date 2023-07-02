class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	devise_group :school_user, contains: [:user, :school_admin, :student]

	before_action :authenticate_school_user!

	rescue_from CanCan::AccessDenied do
	  flash[:error] = 'Access denied!'
	  redirect_back(fallback_location: root_path)
	end

	private

	def current_ability
	  @current_ability ||= Ability.new(current_school_user)
	end
end

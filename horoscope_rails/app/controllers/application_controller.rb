class ApplicationController < ActionController::Base
	rescue_from CanCan::AccessDenied do |exception|
		respond_to do |format|
			format.html { redirect_to new_user_session_path, alert: exception.message }
		end
	end
end

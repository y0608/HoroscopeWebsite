class UsersController < ApplicationController
	load_and_authorize_resource
	
	def index
	end

	def show
		@user = User.find(params[:id])
	end

	def update_role
		@user = User.find(params[:id])
	
		if current_user.admin? && @user.update(user_params)
		  redirect_to users_path, notice: 'User role updated successfully.'
		else
		  redirect_to users_path, alert: 'Failed to update user role.'
		end
	end
	
	def user_params
		params.require(:user).permit(:role)
	end	
end

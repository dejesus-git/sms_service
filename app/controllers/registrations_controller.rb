class RegistrationsController < ApplicationController
	
	def create
		@user  = User.create(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to dashboard_path, flash: { success_sign_up: "Welcome! Here is your dashboard! :)"}
		else
			redirect_to root_path, flash: { error_sign_up: @user.errors.full_messages }
		end
	end

	private

	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end

end

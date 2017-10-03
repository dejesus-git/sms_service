class SessionsController < ApplicationController

	def create
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			cookies.signed[:user_id] = user.id
			redirect_to dashboard_path, flash: { success: "You are signed in!" }
		else
			redirect_to root_path, flash: { session_error: "Sorry we didn't find you :(. Please try again."}
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:success] = "Come back soon! :)"
		redirect_to root
	end
	
end

class UserController < ApplicationController
	before_action :authentication

	# change user attrubutes
	def update
		@current_user.update_attributes(update_params)
		if @current_user.save
			respond_to do |format|
				format.json { render json: { balance: current_user.balance.to_s, message: "the record was saved!", status: 200 } }
			end
		else
			respond_to do |format|
				format.html {}
				format.json { render json: { message: @current_user.errors.messages, status: 400 } }
			end
		end		
	end

	private

	def update_params
		sanitize_params
		update_balance
		params.require(:user).permit(:balance, :twilio_api, :twilio_secret)
	end

	def sanitize_params
		for key in params do
			if key[1] == ""
				params.delete(key[0])
			end
		end
		p params
	end

	def update_balance
		if params[:user][:balance]
			new_balance =  params[:user][:balance].to_d + @current_user.balance
			params[:user][:balance] = new_balance.to_s
		end
	end

end

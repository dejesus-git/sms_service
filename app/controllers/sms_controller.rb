class SmsController < ApplicationController
	before_action :authentication

  def send_messages
    begin
      SendMessagesJob.perform_now(@current_user.twilio_api, 
                                  @current_user.twilio_secret, 
                                  @current_user,
                                  params[:body], params[:phones])
      
      # flash[:success] = "Messages being sent in the background"
    rescue Exception => e
      p e
    end
    respond_to do |format|
      format.html
      format.json { render json: "Very nice", status: 200}
    end
  end

end

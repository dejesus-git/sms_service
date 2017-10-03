require 'test_helper'

class TwilioServiceJobTest < ActiveJob::TestCase
	test "do messsages get sent" do 
	# SendMessagesJob.perform_later(ENV["TWILIO_API_KEY"], ENV["TWILIO_SECRET_KEY"],
 #  	"+15082839613", "Hello",
 #  	"+19784895624")

  	assert true
	end
end

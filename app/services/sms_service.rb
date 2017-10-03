class SmsService
	# thhis class is not actually connected to the twilio api yet.
	# including it would be as simple as storing your api keys in ENV
	# and adding the api request code in the send messages function

	def initialize(accountN, key = nil, user = nil)
		@accountN = accountN
		@key = key
		@user = user
	end

	def user
		puts @user
	end

	def send_messages(body, phones)
		# prepare list of phone numbers
		arr = split_phones(phones)
		# init cost of sending messages
		cost = 0.to_d
		# process phone array
		begin
			arr[0].each do |i|
				cost += 0.02.to_d
			end
		rescue Exception => e
			p e.message
		end
		# return results
		@user.purchase(cost, arr[0], arr[1])
	end

	def sanitize_phones(array)
	  new_arr = [[], []]
	  array.each { |i| i.match('\d{11}') && i.length == 11 ? new_arr[0] << i : new_arr[1] << i }
	  return new_arr
	end

	def split_phones(string)
  	sanitize_phones(string.split(","))
	end

end
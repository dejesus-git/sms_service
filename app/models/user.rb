class User < ApplicationRecord
  # EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  PHONE_NUMBER_REGEX = /[\x2B]{1}\d{11}/
  validates :username, presence: true, uniqueness: true, :length => { :in => 3..20 }
  # validates :twilio_phone_number, format: PHONE_NUMBER_REGEX
  # validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  # validates_length_of :password, :in => 6..20, :on => :create
  
  has_secure_password



  has_many :posts
  has_many :lists
  has_many :images



  # checks if user has sufficient funds
	def balance_confirm
		if self.lists.count.to_d * 0.02.to_d <= self.balance
			return self.lists.pluck(:phone_number)
		else
			return nil
		end
	end

  # decrease balance - used often for sending messages
  def purchase(cost, success_numbers, failure_numbers)
    decrease = self.balance - cost.to_d
    self.update_attributes(balance: decrease)
    # if saved send balance information with reasons attached for balance change
    if self.save
      CostNotificationJob.perform_now(self.balance.to_s, self.id, success_numbers, failure_numbers)
    else
      p "record not saved: account not changed"
    end
  end


  private
  # add to balance amount

  def analyze_this
    byebug
  end

end

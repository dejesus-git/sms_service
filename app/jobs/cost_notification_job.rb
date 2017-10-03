class CostNotificationJob < ApplicationJob
  queue_as :default

  def perform(balance, current_user, success_numbers, failure_numbers)
    # Do something later
    ActionCable.server.broadcast "balance_channel:#{current_user}", 
    balance: balance, success: success_numbers, failure: failure_numbers
  end

end
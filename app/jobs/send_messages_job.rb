class SendMessagesJob < ApplicationJob
  queue_as :default

  def perform(account, key, user, body, phones)
    # Do something later
    service = SmsService.new(account, key, user)
    service.send_messages(body, phones)
  end
end

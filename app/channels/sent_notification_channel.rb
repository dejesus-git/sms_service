# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class SentNotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "sent_notification_channel:1"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

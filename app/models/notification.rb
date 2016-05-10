class Notification < ActiveRecord::Base

  # def self.send_messages
  #   self.all.each do | notification |
  #     self.send_message(notification.number)
  #   end
  # end


    def self.send_messages
      notifications = [{ number: '+447813881269' }]

      notifications.each do | notification |
        self.send_message(notification[:number])
      end
    end


  # def self.to_send
  #   self.all.each do | notification |
  #     if Time.now >= notification.send_at_time
  #       self.send_message(notification.number)
  #       self.delete(notification.id)
  #     end
  #   end
  # end


  def self.send_message(tel_number)
    client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
    client.account.messages.create(
      from: ENV['TWILIO_NUMBER'],
      to:   tel_number,
      body: "Time is up, next pub!"
    )
  end

  def self.new_message(round)
    time = Time.now + (round.challenge.time_allocation * 60)
    self.create(number: round.crawl.mob_number,
                send_at_time: time )
  end
end

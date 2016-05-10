class Notification < ActiveRecord::Base

  def self.send_message(client)
    client.account.messages.create(
      from: ENV['TWILIO_NUMBER'],
      to:   '+447813881269',
      body: "Time is up, next pub!"
    )
  end

  def self.new_notification(round)
    self.create(number: round.crawl.number,
                send_at_time: round.challenge.time_allocation)
  end
end

class Notification < ActiveRecord::Base

  def self.send_message(client, tel_number)
    client.account.messages.create(
      from: ENV['TWILIO_NUMBER'],
      to:   tel_number,
      body: "Time is up, next pub!"
    )
  end

  def self.new_message(round)
    self.create(number: round.crawl.number,
                send_at_time: round.challenge.time_allocation)
  end
end

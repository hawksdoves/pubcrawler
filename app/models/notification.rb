class Notification < ActiveRecord::Base

  def self.send_message(client, tel_number)
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

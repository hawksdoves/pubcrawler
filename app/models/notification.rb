class Notification < ActiveRecord::Base

  def self.to_send
    self.all.each { | notification | self.send_message(notification.number) }
  end


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

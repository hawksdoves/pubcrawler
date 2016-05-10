class Notification < ActiveRecord::Base

  CLIENT = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']


  def self.to_send
    self.all.each { | notification | send_message(notification.number) }
  end


  def send_message(tel_number)
    CLIENT.account.messages.create(
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

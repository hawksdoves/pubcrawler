class RoundsController < ApplicationController
skip_before_action :verify_authenticity_token

	def update
		Round.log_time params[:id]
		Round.reveal_next params[:id]
		round = Round.find params[:id]
		client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
		Notification.send_message(client)
		render :json => { :status => "success", :message => round.crawl}, :status => 200
  end
end

class RoundsController < ApplicationController
skip_before_action :verify_authenticity_token

	def update
		Round.log_time params[:id]
		Round.reveal_next params[:id]
		round = Round.find params[:id]
		Notification.new_message(round)
		Notification.to_send
		render :json => { :status => "success", :message => round.crawl}, :status => 200
  end
end

class RoundsController < ApplicationController
# skip_before_filter :verify_authenticity_token, :only => :create
skip_before_action :verify_authenticity_token

	def update
		p params
		Round.log_time params[:id]
		Round.reveal_next params[:id]
		round = Round.find params[:id]
		# redirect_to crawl_path round.crawl
		render :json => { :status => "success", :message => round.crawl}, :status => 200
  end
end

class CrawlPubsController < ApplicationController
skip_before_filter :verify_authenticity_token, :only => :create

	def update
		CrawlPub.checkin params[:id]
		pub = CrawlPub.find params[:id]
		redirect_to crawl_path pub.crawl
  end
end

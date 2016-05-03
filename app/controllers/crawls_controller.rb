class CrawlsController < ApplicationController

  def index
    @pub = Crawl.yelp_query(params).businesses.sample
    @crawls = Crawl.all
  end


  def show

  end
  # def new
  #   render json: yelp_query
  # end
end

class CrawlsController < ApplicationController

  def index
    render :index
  end

  def new
    yelp_query
  end

  private

  def location_params
    params.permit(:location)[:location]
  end

  def yelp_query
    Yelp.client.search(location_params, { term: 'bars and pubs' })
  end

end

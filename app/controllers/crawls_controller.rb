class CrawlsController < ApplicationController

  def index
    # @pub = Crawl.yelp_query(params).businesses.sample
    @crawls = Crawl.all
  end

  def show

  end

  def new
    @crawl = Crawl.new
  end

  def create
    @crawl = Crawl.new crawl_params
    if @crawl.save
      redirect_to crawls_path
    else
      render 'new'
    end
  end

  private

  def crawl_params
    params.require(:crawl).permit :name
  end

  # def new
  #   render json: yelp_query
  # end
end

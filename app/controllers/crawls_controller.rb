class CrawlsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    @crawls = Crawl.all
    render json: @crawls
  end

  def show
    @crawl = Crawl.find params[:id]
    render json: @crawl, include: [:pubs, :rounds, :challenges]
  end

  def new
    @crawl = Crawl.new
  end

  def create
    crawl = Crawl.new crawl_params
    if crawl.save
      pubs = Crawl.get_pubs(crawl.start_postcode)
      challenges = Crawl.get_challenges

      rounds = pubs.map.with_index do |pub, index|
        Round.create(
                      pub_id: pub.id,
                      challenge_id: challenges[index].id,
                      visible: (index == 0)
                    )
      end

      crawl.rounds << rounds

      render :json => { :status => "success", :message => crawl }, :status => 200
    else
      render 'new'
    end
  end

  private

  def crawl_params
    params.require(:crawl).permit :name, :start_postcode, :mob_number
  end
end

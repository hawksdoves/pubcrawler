class CrawlsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    if current_user
      @crawls = current_user.crawls
      render json: @crawls
    end
  end

  def show
    @crawl = Crawl.find params[:id]
    render json: @crawl, include: [:pubs, :rounds, :challenges]
  end

  def create
    if current_user
      crawl = Crawl.new crawl_params
      if crawl.save
        current_user.crawls << crawl
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
        render :json => { :errors => crawl.errors.full_messages }
      end

    end
  end

  private

  def crawl_params
    params.require(:crawl).permit :name, :start_postcode
  end
end

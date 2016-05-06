class AddChallengeIdToCrawlChallenge < ActiveRecord::Migration
  def change
    add_reference :crawl_challenges, :challenge, index: true, foreign_key: true
  end
end

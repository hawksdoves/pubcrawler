class AddChallengeIdToPubChallenge < ActiveRecord::Migration
  def change
    add_reference :pub_challenges, :challenge, index: true, foreign_key: true
  end
end

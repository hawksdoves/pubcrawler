class AddPubIdToPubChallenge < ActiveRecord::Migration
  def change
    add_reference :pub_challenges, :pub, index: true, foreign_key: true
  end
end

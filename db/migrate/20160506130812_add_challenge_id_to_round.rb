class AddChallengeIdToRound < ActiveRecord::Migration
  def change
    add_reference :rounds, :challenge, index: true, foreign_key: true
  end
end

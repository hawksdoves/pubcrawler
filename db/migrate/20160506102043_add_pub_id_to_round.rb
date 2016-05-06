class AddPubIdToRound < ActiveRecord::Migration
  def change
    add_reference :rounds, :pub, index: true, foreign_key: true
  end
end

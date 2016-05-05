class CreatePubChallenges < ActiveRecord::Migration
  def change
    create_table :pub_challenges do |t|

      t.timestamps null: false
    end
  end
end

class Pub < ActiveRecord::Base
  has_many :pub_challenges, dependent: :destroy
end

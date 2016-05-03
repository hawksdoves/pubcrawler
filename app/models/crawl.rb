class Crawl < ActiveRecord::Base


  def self.pub_picker(array)
    array.sample
  end

end

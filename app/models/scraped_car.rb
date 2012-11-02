class ScrapedCar < ActiveRecord::Base
  validates :url,
            :presence => true,
            :length => {:maximum => 4096}

  validates :title,
            :presence => true,
            :length => {:maximum => 4096}

  validates :content,
            :presence => true
end

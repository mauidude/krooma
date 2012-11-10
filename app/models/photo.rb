class Photo < ActiveRecord::Base
  belongs_to :car

  validates :thumbnail_url,
            :presence => true,
            :length => { :maximum => 1024 }

  validates :url,
            :presence => true,
            :length => { :maximum => 1024 }
end

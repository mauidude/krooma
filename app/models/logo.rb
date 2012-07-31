class Logo < ActiveRecord::Base
  belongs_to :manufacturer

  validates :manufacturer_id,
            :presence => true

  validates :url,
            :presence => true,
            :length => {:maximum => 1024}
end

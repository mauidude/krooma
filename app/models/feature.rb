class Feature < ActiveRecord::Base
  has_and_belongs_to_many :cars

  validates :name,
            :presence => true,
            :length => {:maximum => 50},
            :uniqueness => {:case_sensitive => false}


end

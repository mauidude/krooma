class Model < ActiveRecord::Base
  include ActsAsUrlNameable

  belongs_to :make, :class_name => "Manufacturer"
  has_many :trims
  has_and_belongs_to_many :model_years

  validates :make_id,
            :presence => true

  validates :name,
            :presence => true,
            :length => {:maximum => 50 }

  validates :url_name,
            :presence => true,
            :length => { :maximum => 50 },
            :uniqueness => { :case_sensitive => false }

end

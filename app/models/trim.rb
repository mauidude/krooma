class Trim < ActiveRecord::Base
  include ActsAsUrlNameable

  belongs_to :make, :class_name => "Manufacturer"
  belongs_to :model

  validates :make_id,
            :presence => true

  validates :model_id,
            :presence => true

  validates :name,
            :presence => true,
            :length => { :maximum => 50 }

  validates :url_name,
            :presence => true,
            :uniqueness => { :case_sensitive => false },
            :length => {:maximum => 50 }

end

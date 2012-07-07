class Car < ActiveRecord::Base
  belongs_to :make, :class_name => "Manufacturer"
  belongs_to :model
  belongs_to :trim
  belongs_to :poster, :class_name => "User"
  belongs_to :model_year
  belongs_to :condition

  validates :make_id,
            :presence => true

  validates :model_id,
            :presence => true

  validates :poster_id,
            :presence => true

  validates :model_year_id,
            :presence => true

  validates :asking_price,
            :presence => true,
            :numericality => { :only_integer => true, :greater_than => 0 }

  validates :condition_id,
            :presence => true

  validates :vin,
            :vin => true

  validates :description,
            :presence => true

end

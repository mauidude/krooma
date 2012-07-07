class Car < ActiveRecord::Base
  belongs_to :make, :class_name => "Manufacturer"
  belongs_to :model
  belongs_to :trim
  belongs_to :poster, :class_name => "User"
  belongs_to :model_year
  belongs_to :condition
  belongs_to :interior_color, :class_name => "Color"
  belongs_to :exterior_color, :class_name => "Color"
  belongs_to :body_style
  belongs_to :transmission

  validates :make_id,
            :presence => true

  validates :model_id,
            :presence => true

  validates :poster_id,
            :presence => true

  validates :model_year_id,
            :presence => true

  validates :interior_color_id,
            :presence => true

  validates :exterior_color_id,
            :presence => true

  validates :body_style_id,
            :presence => true

  validates :transmission_id,
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

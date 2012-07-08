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

  searchable do
    integer :asking_price
    time :date_created

    string :condition do
      condition.name
    end

    string :body_style do
      body_style.name
    end

    string :make do
      make.name
    end

    string :model do
      model.name
    end

    string :trim do
      trim == nil ? nil : trim.name
    end

    integer :model_year do
      model_year.year
    end

    string :interior do
      interior_color.name
    end

    string :exterior do
      exterior_color.name
    end

    string :transmission do
      transmission.name
    end

    # New 2012 Honda Civic EX Sedan
    text :summary do
      "#{condition.name} #{model_year.year} #{make.name} #{model.name}#{trim == nil ? "" : (" " + trim.name + " ")}#{body_style.name}"
    end

    text :description
  end

end

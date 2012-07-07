class ModelYear < ActiveRecord::Base
  has_and_belongs_to_many :models

  validates :year,
            :presence => true,
            :uniqueness => true,
            :numericality => { :only_integer => true, :greater_than_or_equal_to => 1900, :less_than_or_equal_to => 2020 }

  def to_param
    year
  end

  def self.from_param(value)
    find_by_year value
  end

  def self.from_param!(value)
    find_by_year! value
  end
end

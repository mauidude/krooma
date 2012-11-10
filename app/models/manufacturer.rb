class Manufacturer < ActiveRecord::Base
  include ActsAsUrlNameable

  has_many :models, :foreign_key => "make_id", :order => "name"
  has_one :logo

  validates :name,
            :presence => true,
            :length => {:maximum => 50}

  validates :url_name,
            :presence => true,
            :length => {:maximum => 50},
            :uniqueness => { :case_sensitive => false }

  validates :description,
            :presence => true
end
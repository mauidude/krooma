class Color < ActiveRecord::Base
  validates :name,
            :presence => true,
            :length => { :maximum => 50 },
            :uniqueness => { :case_sensitive => false, :scope => :external  }

  validates :external,
            :inclusion => [true,false]
end

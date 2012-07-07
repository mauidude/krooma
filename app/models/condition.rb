class Condition < ActiveRecord::Base
  includes ActsAsUrlNameable

  validates :name,
            :presence => true,
            :length => { :maximum => 50 }

  validates :url_name,
            :presence => true,
            :uniqueness => { :case_sensitive => false },
            :length => { :maximum => 50 }


  validates :used,
            :presence => true
end

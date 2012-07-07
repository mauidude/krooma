class BodyStyle < ActiveRecord::Base
  include ActsAsUrlNameable

  validates :name,
            :presence => true,
            :length => { :maximum => 50 }

  validates :url_name,
            :presence => true,
            :length => { :maximum => 50 },
            :uniqueness => { :case_sensitive => false }
end

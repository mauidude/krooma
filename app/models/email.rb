class Email < ActiveRecord::Base
  validates :address,
            :presence => true,
            :uniqueness => {:case_sensitive => false},
            :length => { :maximum => 256 },
            :email => { :allow_blank => true }

end

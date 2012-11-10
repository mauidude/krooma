class Email < ActiveRecord::Base
  devise :database_authenticatable,
         :token_authenticatable,
         :confirmable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  # taken care of by devise
  #validates :address,
            #:presence => true,
            #:uniqueness => {:case_sensitive => false},
            #:length => { :maximum => 256 },
            #:email => { :allow_blank => true }
end

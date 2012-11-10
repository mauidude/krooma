class CarAlert < ActiveRecord::Base
  belongs_to :email
  serialize :search, Hash

  validates :email_id,
            :presence => true


  validates :search,
            :presence => { :allow_blank => true }

  accepts_nested_attributes_for :email


  def verify
    self.verified_at = Time.now.utc if verified_at.nil?
    save
  end
end

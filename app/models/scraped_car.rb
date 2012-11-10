require 'nokogiri'

class ScrapedCar < ActiveRecord::Base
  validates :url,
            :presence => true,
            :length => {:maximum => 4096}

  validates :title,
            :presence => true,
            :length => {:maximum => 4096}

  validates :content,
            :presence => true

  def self.next
    ScrapedCar.where(:car_id => nil).first
  end

  def sanitized
    html = Nokogiri::HTML(self.content)
    html.xpath('//script').remove
    html.xpath('//comment()').remove

    html.text
  end

  def images
    html = Nokogiri::HTML(self.content)

    html.xpath('//img[@id="iwi"]/@src|//div[@class="tn"]/a/@href').map { |img| img.value }
  end
end

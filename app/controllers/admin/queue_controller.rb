require 'nokogiri'

class Admin::QueueController < ApplicationController
  layout 'base'

  def index
    @scraped_car = ScrapedCar.next
  end
end

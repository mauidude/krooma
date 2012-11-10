class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter do |controller|
    @meta_robots = []
  end

  protected
  def no_index
    @meta_robots << "noindex"
  end
end

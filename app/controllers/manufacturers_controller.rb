class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.order :name
  end

  def show
    @manufacturer = Manufacturer.includes(:logo).from_param! params[:id]

    @cars = Car.do_search({:make => @manufacturer.name, :order_by => {:field => :created_at, :direction => :desc}}, 50).results
  end
end

class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.order :name
  end

  def show
    @manufacturer = Manufacturer.includes(:logo).from_param! params[:id]

    @cars = Car.do_search({:make => @manufacturer.name, :order_by => {:field => :created_at, :direction => :desc}}, 50).results
  end

  def api_models
    @manufacturer = Manufacturer.from_param! params[:id]
    @models = @manufacturer.models.map { |model| {:id => model.id, :name => model.name, :url_name => model.url_name }}

    respond_to do |format|
      format.js { render :json => @models.to_json }
    end
  end
end

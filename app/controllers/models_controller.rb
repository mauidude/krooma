class ModelsController < ApplicationController
  def show
    @manufacturer = Manufacturer.from_param! params[:make_id]
    @model = Model.find_by_make_id_and_url_name @manufacturer.id, params[:id]

    @cars = Car.do_search({:model => @model.name, :order_by => {:field => :created_at, :direction => :desc}}, 50).results
  end

  def api_trims
    @manufacturer = Manufacturer.from_param! params[:make_id]
    @model = Model.find_by_make_id_and_url_name @manufacturer.id, params[:id]

    @trims = @model.trims.map { |model| {:id => model.id, :name => model.name, :url_name => model.url_name }}

    respond_to do |format|
      format.js { render :json => @trims }
    end
  end

  def api_model_years
    @manufacturer = Manufacturer.from_param! params[:make_id]
    @model = Model.find_by_make_id_and_url_name @manufacturer.id, params[:id]

    #TODO associate model_years and models
    #@model_years = @model.model_years.map { |model| { :id => model.id, :year => model.year } }
    @model_years = ModelYear.all.map { |year| {:id => year.id, :year => year.year}}

    respond_to do |format|
      format.js { render :json => @model_years }
    end
  end
end

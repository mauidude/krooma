class ModelsController < ApplicationController
  def show
    @manufacturer = Manufacturer.from_param! params[:make_id]
    @model = Model.find_by_make_id_and_url_name @manufacturer.id, params[:id]


    @cars = Car.do_search({:model => @model.name, :order_by => {:field => :created_at, :direction => :desc}}, 50).results
  end
end

class CarsController < ApplicationController
  before_filter :find_car, :only => [:show, :similar]
  before_filter :no_index, :only => [:search]

  def search
    results = Car.do_search(params)
    @cars = results.results
    @facets = results.facets
    @applied_facets = results.applied_facets
  end

  def show
    @similar_cars = @car.similar({}, 5).results
  end

  def similar
    @cars = @car.similar(params).results
  end

  private
  def find_car
    @car = Car.from_param params[:id]
  end
end

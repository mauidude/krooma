class CarsController < ApplicationController
  def search
    results = Car.do_search(params)
    @cars = results.results
    @facets = results.facets
    @applied_facets = results.applied_facets
  end
end

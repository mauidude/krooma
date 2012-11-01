class CarsController < ApplicationController
  include Transloadit::Rails::ParamsDecoder

  before_filter :find_car, :only => [:show, :similar]
  before_filter :no_index, :only => [:search]

  def new
    @car = Car.new(:current_step => 0)

    render :layout => 'base'
  end

  def create
    @car = Car.new(params[:car])

    unless params[:transloadit].blank?
      params[:transloadit][:results][:thumb].each_with_index do |x, i|
        @car.photos << Photo.new(
            :thumbnail_url => params[:transloadit][:results][:thumb][i][:url],
            :url => params[:transloadit][:results][:resize][i][:url]
        )
      end
    end

    if @car.valid?
      if @car.current_step < 3
         @car.current_step += 1

         @car.build_poster if @car.poster.nil?
      else
        @car.save
        return redirect_to @car, :notice => "Your car has been posted for sale! See it below in all its glory!"
      end
    end

    render :action => 'new', :layout => 'base'
  end

  def search
    results = Car.do_search(params)
    @cars = results.results
    @facets = results.facets
    @applied_facets = results.applied_facets
  end

  def show
    @similar_cars = @car.similar({}, 8).results
  end

  def similar
    @cars = @car.similar(params).results
  end

  private
  def find_car
    @car = Car.from_param params[:id]
  end
end

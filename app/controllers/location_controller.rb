class LocationController < ApplicationController
  def suggest
    @results = Location.suggest params[:q]

    respond_to do |format|
      format.json { render :json => @results.to_json }
      format.xml { render :xml => @results }
    end
  end
end

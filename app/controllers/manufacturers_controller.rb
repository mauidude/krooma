class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.order :name
  end
end

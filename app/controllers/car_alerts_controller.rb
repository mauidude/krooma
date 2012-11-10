class CarAlertsController < ApplicationController
  def create
    @redirect = params[:redirect]
    @car_alert = CarAlert.new params[:car_alert]

    begin
      ActiveRecord::Base.transaction do
        @email = Email.find_or_create_by_address!(@car_alert.email.address) unless @car_alert.email.nil?

        @car_alert.email = @email
        @car_alert.save!
      end
    rescue
      flash[:car_alert] = params[:car_alert]
    end


    #TODO: need default action
    redirect_to @redirect
  end
end

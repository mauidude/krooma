module CarsHelper
  def truncate_safe(text, length = 250)
    text.html_safe? ? text : truncate(text, :length => length)
  end

  def search_without_parameter(key, parameters = params)
    key = key.to_s
    new_params = parameters.reject { |k| k == key || k == 'page' }

    search_cars_path(new_params)
  end

  def search_description(parameters = params)
    description = []
    description << params[:condition] unless params[:condition].blank?
    description << params[:model_year] unless params[:model_year].blank?
    description << params[:exterior] unless params[:exterior].blank?
    description << params[:transmission] unless params[:transmission].blank?
    description << params[:body_style] unless params[:body_style].blank?
    description << params[:make] unless params[:make].blank?
    description << params[:model] unless params[:model].blank?
    description << params[:trim] unless params[:trim].blank?
    description << Car.model_name.pluralize
    description << "with #{params[:interior]} Interior" unless params[:interior].blank?
    description << "between #{params[:asking_price]}" unless params[:asking_price].blank?
    description << "near #{@location}" unless @location.blank?

    description.join ' '
  end
end

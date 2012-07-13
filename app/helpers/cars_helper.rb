module CarsHelper
  def truncate_safe(text, length = 250)
    text.html_safe? ? text : truncate(text, :length => length)
  end

  def search_without_parameter(key, parameters = params)
    key = key.to_s
    new_params = parameters.reject { |k| k == key || k == 'page' }

    search_cars_path(new_params)
  end
end

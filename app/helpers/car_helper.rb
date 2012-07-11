module CarHelper
  def search_without_parameter(key, parameters = params)
    key = key.to_s
    new_params = parameters.reject { |k| k == key || k == 'page' }

    search_cars_path(new_params)
  end
end
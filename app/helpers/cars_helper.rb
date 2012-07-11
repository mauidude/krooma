module CarsHelper
  def truncate_safe(text, length = 250)
    text.html_safe? ? text : truncate(text, :length => length)
  end
end

class AppliedFacet
  attr_reader :key, :value, :raw_value

  def initialize(key, value, raw_value = nil)
    @key = key
    @value = value
    @raw_value = raw_value || value
  end
end
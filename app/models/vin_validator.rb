class VinValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value != nil and (value.length != 17 or !verify_checksum(transliterate value))
      record.errors[attribute] << (options[:message] || "is not a valid VIN number")
    end
  end

  private
  def transliterate(value)
    value.downcase.tr('abcdefghjklmnprstuvwxyz','12345678123457923456789')
  end

  def verify_checksum(value)
    weights = [8,7,6,5,4,3,2,10,0,9,8,7,6,5,4,3,2]

    sum = 0

    weights.each_with_index do |w,i|
      sum += value[i].to_i * w
    end

    mod = sum % 11
    mod = 'x' if mod == 10

    value[9].to_i == mod
  end
end
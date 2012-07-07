module ActsAsUrlNameable
  def self.included(base)
    base.before_save :downcase_url_name

    base.class_eval do
      def to_param
        url_name
      end

      def self.from_param(value)
        find_by_url_name(value)
      end

      def self.from_param!(value)
        find_by_url_name!(value)
      end
    end
  end

  private
  def downcase_url_name
    url_name.downcase! unless url_name.nil?
  end
end
class SearchResults
  attr_reader :results, :applied_facets

  def initialize(raw_results, applied_facets = [])
    @raw_results = raw_results
    @results = []

    @raw_results.each_hit_with_result do |hit, result|
      @results << SearchResultRow.new(result, hit)
    end

    @results = Sunspot::Search::PaginatedCollection.new(@results, raw_results.query.page, raw_results.query.per_page, raw_results.total)
    @applied_facets = applied_facets
  end

  def facets
    @raw_results.facets
  end

  private
  class SearchResultRow
    attr_reader :result

    def initialize(raw_result, hit)
      @result = raw_result
      @hit = hit
    end

    def to_param
      @result.primary
    end

    def method_missing(id, *args, &block)

      if @hit.highlights(id).empty?
        @result.send(id)
      else
        result = ''

        items = []
        @hit.highlights(id).each do |hl|
          items << hl.format { |word| "<strong>#{word}</strong>" }
        end

        result = items.join("&hellip; ")

        result.html_safe
      end
    end

    delegate :model_name, :id, :to_param, :to_s, :to => :result
  end
end
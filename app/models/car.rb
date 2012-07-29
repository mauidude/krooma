class Car < ActiveRecord::Base
  belongs_to :make, :class_name => "Manufacturer"
  belongs_to :model
  belongs_to :trim
  belongs_to :poster, :class_name => "User"
  belongs_to :model_year
  belongs_to :condition
  belongs_to :interior_color, :class_name => "Color", :conditions => "external = false"
  belongs_to :exterior_color, :class_name => "Color", :conditions => "external = true"
  belongs_to :body_style
  belongs_to :transmission

  validates :make_id,
            :presence => true

  validates :model_id,
            :presence => true

  validates :poster_id,
            :presence => true

  validates :model_year_id,
            :presence => true

  validates :interior_color_id,
            :presence => true

  validates :exterior_color_id,
            :presence => true

  validates :body_style_id,
            :presence => true

  validates :transmission_id,
            :presence => true

  validates :asking_price,
            :presence => true,
            :numericality => { :only_integer => true, :greater_than => 0 }

  validates :condition_id,
            :presence => true

  validates :vin,
            :vin => true

  validates :description,
            :presence => true

  searchable do
    integer :asking_price
    time :created_at

    string :condition do
      condition.used ? "Used" : "New"
    end

    string :body_style do
      body_style.name
    end

    string :make do
      make.name
    end

    string :model do
      model.name
    end

    string :trim do
      trim == nil ? nil : trim.name
    end

    integer :model_year do
      model_year.year
    end

    string :interior do
      interior_color.name
    end

    string :exterior do
      exterior_color.name
    end

    string :transmission do
      transmission.name
    end

    text :summary, :stored => true, :more_like_this => true
    text :description, :stored => true

    text :condition, :more_like_this => true do
      condition.used ? "Used" : "New"
    end

    text :body_style, :more_like_this => true do
      body_style.name
    end

    text :make, :more_like_this => true do
      make.name
    end

    text :model, :more_like_this => true do
      model.name
    end

    text :trim, :more_like_this => true do
      trim == nil ? nil : trim.name
    end

    text :model_year, :more_like_this => true do
      model_year.year
    end

    text :interior, :more_like_this => true do
      interior_color.name
    end

    text :exterior, :more_like_this => true do
      exterior_color.name
    end

    text :transmission, :more_like_this => true do
      transmission.name
    end
  end

  def new?
    1.day.ago <= created_at
  end

  def summary
    # New 2012 Honda Civic EX Sedan
    "#{condition.used ? "Used" : "New"} #{model_year.year} #{make.name} #{model.name} #{trim == nil ? "" : (trim.name + " ")}#{body_style.name}"
  end

  def to_param
    "#{summary} #{id}".parameterize
  end

  def self.from_param(param)
    match = /^.+?\-(?<id>\d+)$/.match param

    raise ActiveRecord::RecordNotFound.new(:id => param) if !match || match[:id].blank?

    car = Car.find match[:id]

    if car.to_param != param
      raise ActiveRecord::RecordNotFound.new(:id => param)
    else
      car
    end
  end

  def similar(params = {}, per_page = 10)
    results = Sunspot.more_like_this(self) do
      fields :make, :boost => 10
      fields :model, :boost => 8
      fields :trim, :boost => 1
      fields :condition, :boost => 3
      fields :model_year, :boost => 2
      fields :body_style, :boost => 3
      fields :interior, :boost => 1
      fields :exterior, :boost => 1.5
      fields :transmission, :boost => 1

      minimum_word_length 3

      paginate :page => (params[:page] || 1), :per_page => per_page
    end

    SearchResults.new(results)
  end

  def self.do_search(params = {}, per_page = 10)
    asking_price = parse_asking_price params[:asking_price]

    applied_facets = []
    applied_facets << AppliedFacet.new(:asking_price, asking_price, params[:asking_price]) unless asking_price.blank?
    applied_facets << AppliedFacet.new(:make, params[:make]) unless params[:make].blank?
    applied_facets << AppliedFacet.new(:model, params[:model]) unless params[:model].blank?
    applied_facets << AppliedFacet.new(:trim, params[:trim]) unless params[:trim].blank?
    applied_facets << AppliedFacet.new(:model_year, params[:model_year]) unless params[:model_year].blank?
    applied_facets << AppliedFacet.new(:condition, params[:condition]) unless params[:condition].blank?
    applied_facets << AppliedFacet.new(:body_style, params[:body_style]) unless params[:body_style].blank?
    applied_facets << AppliedFacet.new(:interior, params[:interior]) unless params[:interior].blank?
    applied_facets << AppliedFacet.new(:exterior, params[:exterior]) unless params[:exterior].blank?
    applied_facets << AppliedFacet.new(:transmission, params[:transmission]) unless params[:transmission].blank?

    results = Car.search :include => [:make, :model, :trim, :model_year, :condition, :body_style, :interior_color, :exterior_color, :transmission] do
      fulltext params[:q] do
        boost_fields :summary => 3.0
        phrase_fields :summary => 3.0
        query_phrase_slop 3

        highlight :summary, :description,
                  :fragment_size => 50,
                  :merge_contiguous_fragments => true,
                  :max_snippets => 5
      end unless params[:q].blank?

      facet(:asking_price) do
        row(:"Under $5k") do
          with :asking_price, 0..5000
        end
        row(:"$5k-$10k") do
          with :asking_price, 5000..10000
        end

        step = 10000
        10000.step(100000, step) do |i|
          row(:"$#{i/1000}k-$#{(i + step)/1000}k") do
            with :asking_price, Range.new(i, i + step, true)
          end
        end

        row(:"Over $100k") do
          with(:asking_price).greater_than(100000)
        end
      end

      facet :make if params[:make].blank?
      facet :model if params[:model].blank?
      facet :trim if params[:trim].blank? and !params[:model].blank?  #only facet on trim if a model is given
      facet :model_year, :sort => :index if params[:model_year].blank?
      facet :condition if params[:condition].blank?
      facet :body_style if params[:body_style].blank?
      facet :interior if params[:interior].blank?
      facet :exterior if params[:exterior].blank?
      facet :transmission if params[:transmission].blank?

      applied_facets.each do |facet|
        with facet.key, facet.value
      end

      paginate :page => (params[:page] || 1), :per_page => per_page
    end

    SearchResults.new(results, applied_facets)
  end


  private
  def self.parse_asking_price(asking_price)
    unless asking_price.blank?
      asking_price = asking_price.gsub /\$(\d+)k/, '\1000'
      asking_price = asking_price.gsub /[^\d\-]/, ""
      asking_price = asking_price.split /\-/

      if asking_price.length == 1
        asking_price = asking_price.to_i
      elsif asking_price.length == 2
        asking_price = Range.new(asking_price[0], asking_price[1], true)
      end
    end
    asking_price
  end
end

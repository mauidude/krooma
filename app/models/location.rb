class Location < ActiveRecord::Base
  validates :postal_code,
            :presence => true,
            :length => {:is => 5}

  validates :city,
            :presence => true,
            :length => {:maximum => 30}

  validates :state_code,
            :presence => true,
            :length => {:is => 2}

  validates :county,
            :length => {:maximum => 128}

  validates :country_code,
            :presence => true,
            :length => {:is => 2}

  validates :latitude,
            :presence => true,
            :numericality => true

  validates :longitude,
            :presence => true,
            :numericality => true

  validates :region,
            :length => {:maximum => 256}

  validates :population,
            :numericality => {:only_integer => true}

  validates :timezone,
            :length => {:maximum => 64}

  def name
    "#{city}, #{state_code}"
  end

  searchable do
    string :postal_code
    string :name

    text :autosuggest, :as => :name_as do
      ["#{normalize city} #{normalize state_code}", postal_code].map {|x| x}
    end

    string :names, :multiple => true do
      ["#{normalize city} #{normalize state_code}", postal_code].map {|x| x}
    end

    location(:coordinates) { Sunspot::Util::Coordinates.new(latitude, longitude)}
  end

  def self.find(text)
    results = Location.search do
      with :names, normalize(text)
      group :name do
        limit 1
      end
      paginate :page => 1, :per_page => 1
    end.results

    results.first
  end

  def self.suggest(text)
    results = Location.search do
      fulltext "\"#{normalize(text)}\"" do
        fields :autosuggest
      end

      facet :name, :limit => 10, :sort => :index
    end

    results.facet(:name).rows.map { |f| f.value }.to_a
  end

  private
  def self.normalize(location)
    location.gsub(/,+|-+|\'+|\.+/, '').gsub(/\s+/, ' ').strip
  end
end

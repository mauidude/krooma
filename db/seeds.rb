# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


makes = {
    "BMW" => {
        "128" => ["i"],
        "135" => ["i"],
        "328" => ["i", "xi", "ci"],
        "335" => ["i", "xi", "ci", "d"],
        "528" => ["i", "xi"],
        "535" => ["i", "xi"],
        "550" => ["i", "xi"],
        "750" => ["i", "li"]
    },
    "Honda" => {
        "Civic" => ["Base", "Si", "HF", "Hybrid", "Natural Gas"],
        "Accord" => %W(EX DX LX),
        "Pilot" => %W(LX EX EX-L Touring),
        "Odyssey" => %W(LX EX EX-L Touring)
    },
    "Toyota" => {
        "Prius" => %W(I II III IV V),
        "Corolla" => %W(L LE S),
        "Camry" => ["L", "LE", "SE", "XLE", "Hybrid LE", "Hybrid XLE"],
        "Tundra" => ["Regular Cab", "Double Cab", "CrewMax"]
    },
    "Acura" => {
        "TSX" => [],
        "TL" => [],
        "MDX" => []
    },
    "Lexus" => {
      "RX" => ["350", "F Sport", "h"],
      "IS" => ["250 RWD", "250 AWD", "350 RWD", "350 AWD"]
    }
}

logos = {
    "BMW" => "http://upload.wikimedia.org/wikipedia/en/thumb/f/f9/BMW_Logo.svg/200px-BMW_Logo.svg.png",
    "Honda" => "http://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Honda-logo.svg/200px-Honda-logo.svg.png",
    "Toyota" => "http://upload.wikimedia.org/wikipedia/en/thumb/e/e7/Toyota.svg/200px-Toyota.svg.png",
    "Acura" => "http://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Acura_logo.svg/200px-Acura_logo.svg.png",
    "Lexus" => "http://upload.wikimedia.org/wikipedia/en/thumb/d/d1/Lexus_division_emblem.svg/200px-Lexus_division_emblem.svg.png"
}

random = Random.new

ActiveRecord::Base.transaction do
  body_styles = BodyStyle.create!([
                                     {:name => "Sedan", :url_name => "sedan"},
                                     {:name => "Coupe", :url_name => "coupe"},
                                     {:name => "Convertible", :url_name => "convertible" },
                                     {:name => "SUV", :url_name => "SUV" }
                                 ])

  exterior_colors = Color.create!([
                                     {:name => "Black", :external => true },
                                     {:name => "Silver", :external => true },
                                     {:name => "Blue", :external => true },
                                     {:name => "Red", :external => true },
                                     {:name => "White", :external => true },
                                     {:name => "Green", :external => true },
                                     {:name => "Brown", :external => true },
                                     {:name => "Gold", :external => true },
                                     {:name => "Gray", :external => true },
                                     {:name => "Other", :external => true }
                                 ])

  interior_colors = Color.create!([
                                     {:name => "Black", :external => false },
                                     {:name => "Tan", :external => false },
                                     {:name => "Gray", :external => false },
                                     {:name => "Dark Gray", :external => false },
                                     {:name => "Other", :external => false }
                                 ])

  conditions = Condition.create!([
                                    {:name => "New", :url_name => "new", :used => false },
                                    {:name => "Excellent", :url_name => "excellent", :used => true },
                                    {:name => "Great", :url_name => "great", :used => true },
                                    {:name => "Fair", :url_name => "fair", :used => true },
                                    {:name => "Poor", :url_name => "poor", :used => true }
                                ])

  years = ModelYear.create!([
                               {:year => 2012},
                               {:year => 2011},
                               {:year => 2010},
                               {:year => 2009},
                               {:year => 2008},
                               {:year => 2007},
                               {:year => 2006},
                               {:year => 2005},
                               {:year => 2004},
                               {:year => 2003},
                           ])

  transmissions = Transmission.create!([
                                          {:name => "Automatic"},
                                          {:name => "Manual"}
                                      ])

  locations = Location.find_all_by_county_and_state_code "Orange County", "CA"

  makes.each do |make_name, models|
    manufacturer = Manufacturer.create({
      name: make_name,
      url_name: make_name.dasherize,
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sit amet fermentum nunc. In hac habitasse platea dictumst. Integer pulvinar, elit vitae rhoncus lobortis, leo eros mattis est, sed posuere nibh enim at sapien. Nam a neque felis. Aenean et porta ipsum. Suspendisse potenti."
      })

    logo = Logo.create({
      url: logos[make_name]
    })

    models.each do |model_name, trims|
      model = Model.create({
        name: model_name,
        url_name: model_name.dasherize,
        make: manufacturer,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sit amet fermentum nunc. In hac habitasse platea dictumst. Integer pulvinar, elit vitae rhoncus lobortis, leo eros mattis est, sed posuere nibh enim at sapien. Nam a neque felis. Aenean et porta ipsum. Suspendisse potenti."
      })

      if trims.empty?
        5.times do
          Car.create!({
            :asking_price => random.rand(10000...100000),
            :body_style => body_styles[random.rand(body_styles.length)],
            :condition => conditions[random.rand(conditions.length)],
            :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sit amet fermentum nunc. In hac habitasse platea dictumst. Integer pulvinar, elit vitae rhoncus lobortis, leo eros mattis est, sed posuere nibh enim at sapien. Nam a neque felis. Aenean et porta ipsum. Suspendisse potenti.",
            :exterior_color =>  exterior_colors[random.rand(exterior_colors.length)],
            :interior_color => interior_colors[0],
            :make => manufacturer,
            :model => model,
            :model_year => years[random.rand(years.length)],
            :poster_id => 0,
            :transmission => transmissions[random.rand(transmissions.length)],
            :trim => nil,
            :mileage => random.rand(100000),
            :location => locations[random.rand(locations.length)]
          })
        end
      else
        trims.each do |trim_name|
          trim = Trim.create({make: manufacturer, model: model, name: trim_name, url_name: trim_name.dasherize})

          5.times do
            Car.create!({
               :asking_price => random.rand(10000...100000),
               :body_style => body_styles[random.rand(body_styles.length)],
               :condition => conditions[random.rand(conditions.length)],
               :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sit amet fermentum nunc. In hac habitasse platea dictumst. Integer pulvinar, elit vitae rhoncus lobortis, leo eros mattis est, sed posuere nibh enim at sapien. Nam a neque felis. Aenean et porta ipsum. Suspendisse potenti.",
               :exterior_color =>  exterior_colors[random.rand(exterior_colors.length)],
               :interior_color => interior_colors[1],
               :make => manufacturer,
               :model => model,
               :model_year => years[random.rand(years.length)],
               :poster_id => 0,
               :transmission => transmissions[random.rand(transmissions.length)],
               :trim => trim,
               :mileage => random.rand(100000),
               :location => locations[random.rand(locations.length)]
             })
          end
        end
      end
    end
  end
end
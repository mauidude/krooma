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

ActiveRecord::Base.transaction do
  makes.each do |make_name, models|
    manufacturer = Manufacturer.create({name: make_name, url_name: make_name.dasherize})

    models.each do |model_name, trims|
      model = Model.create({name: model_name, url_name: model_name.dasherize, make: manufacturer})

      trims.each do |trim_name|
        trim = Trim.create({make: manufacturer, model: model, name: trim_name, url_name: trim_name.dasherize})
      end
    end
  end
end
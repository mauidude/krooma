# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :car_alerts do
    email
    search { {:q => "honda civic"} }
  end
end

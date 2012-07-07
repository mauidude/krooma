# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :model do
    name "Civic"
    url_name "civic"
    association :make, factory: :manufacturer
  end
end

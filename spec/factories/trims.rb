# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :trim do
    name "LX"
    url_name "lx"
    model
    make { model.make }
  end
end

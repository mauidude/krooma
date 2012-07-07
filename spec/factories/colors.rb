# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :exterior_color, class: Color do
    name "Silver"
    external true
  end

  factory :interior_color, class: Color do
    name "Black"
    external false
  end
end

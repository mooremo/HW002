FactoryGirl.define do
  factory :profile do
    last_name { Faker::Name.last_name }
    first_name { Faker::Name.first_name }
    gender { ['male', 'female'].sample }
    favorite_color { Faker::Color.color_name.downcase }
    date_of_birth { Faker::Date.backward }
  end
end

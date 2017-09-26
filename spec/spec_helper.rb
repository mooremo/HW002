require 'rspec'
require 'factory_girl'
require 'faker'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    FactoryGirl.find_definitions
  end
end

def generate_row(delimeter = [' ', ' | ', ', '].sample)
  row = []
  row << Faker::Name.last_name
  row << Faker::Name.first_name
  row << ['male','female'].sample
  row << Faker::Color.color_name
  row << Faker::Date.backward.strftime('%-m/%-d/%Y')
  row.join(delimeter)
end

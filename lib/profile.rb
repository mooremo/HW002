require 'date'

class Profile
  attr_accessor :last_name
  attr_accessor :first_name
  attr_accessor :gender
  attr_accessor :favorite_color
  attr_accessor :date_of_birth

  def initialize(attributes={})
    @last_name = attributes['last_name']
    @first_name = attributes['first_name']
    @gender = attributes['gender'] && attributes['gender'].downcase
    @favorite_color = attributes['favorite_color'] && attributes['favorite_color'].downcase
    @date_of_birth = attributes['date_of_birth'] && DateTime.strptime(attributes['date_of_birth'].to_s, '%m/%d/%Y')
  end

  def self.parse(row)
    # can use this regex because:
    # "You may assume that the delimiters (commas, pipes and spaces) do not appear anywhere in the data values themselves."
    # ASSUMPTION: It will never be given a malformed row. this allows me to avoid validations or checks and exclude exception handling.
    match_data = row.match(/^(?<last_name>\w+)\W+(?<first_name>\w+)\W+(?<gender>\w+)\W+(?<favorite_color>\w+)\W+(?<date_of_birth>[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{4})$/)
    new(match_data.names.zip(match_data.captures).to_h)
  end
end

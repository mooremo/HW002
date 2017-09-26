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
    @date_of_birth = attributes['date_of_birth'] && DateTime.parse(attributes['date_of_birth'].to_s)
  end
end

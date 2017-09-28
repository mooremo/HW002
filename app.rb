require 'sinatra'

require_relative 'lib/profile'
require_relative 'lib/profile_collection'

Collection = ProfileCollection.new

get '/records/gender' do
  content_type :json
  Collection.sort!(['gender'])
  Collection.to_json
end

get '/records/birthdate' do
  content_type :json
  Collection.sort!(['date_of_birth'])
  Collection.to_json
end

# QUESTION: First Name, Last Name, or Full Name?
get '/records/name' do
  content_type :json
  Collection.sort!(['last_name', 'first_name'])
  Collection.to_json
end

post '/records' do
  content_type :json
  profile = Profile.parse(params['record_line'])
  Collection.profiles << profile
  status 201
  profile.to_json
end

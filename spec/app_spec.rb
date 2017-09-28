require_relative '../app.rb'
require 'rack/test'

set :environment, :test

def app
  Sinatra::Application
end


describe 'API' do
  include Rack::Test::Methods

  context 'POST' do
    describe '/records' do
      it 'should add a record to the collection and return the created record with a code of 201' do
        post '/records', 'record_line'  => 'Homenick | Shany | female | blue | 2/10/2017'
        body = JSON.parse(last_response.body)

        expect(body).to eq({'last_name'=>'Homenick',
                            'first_name'=>'Shany',
                            'gender'=>'female',
                            'favorite_color'=>'blue',
                            'date_of_birth'=>'2/10/2017'})
        expect(last_response.status).to eq(201)

        post '/records', 'record_line'  => 'Adams | James | male | red | 3/17/2000'
        body = JSON.parse(last_response.body)

        expect(body).to eq({'last_name'=>'Adams',
                            'first_name'=>'James',
                            'gender'=>'male',
                            'favorite_color'=>'red',
                            'date_of_birth'=>'3/17/2000'})
        expect(last_response.status).to eq(201)
      end
    end
  end

  context 'GET' do
    describe '/records/gender' do
      it 'should return the collection of records sorted by gender' do
        get '/records/gender'
        body = JSON.parse(last_response.body)
        genders = body.map {|record| record['gender']}
        expect(genders).to eq(['male', 'female'])
      end
    end

    describe '/records/birthdate' do
      it 'should return the collection of records sorted by birthdate' do
        get '/records/birthdate'
        body = JSON.parse(last_response.body)
        birthdates = body.map {|record| record['date_of_birth']}
        expect(birthdates).to eq(['2/10/2017', '3/17/2000'])
      end
    end

    describe '/records/name' do
      it 'should return the collection of records sorted by name' do
        get '/records/name'
        body = JSON.parse(last_response.body)
        names = body.map {|record| record['last_name']}
        expect(names).to eq(['Homenick', 'Adams'])
      end
    end
  end
end

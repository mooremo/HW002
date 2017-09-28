require 'rspec'
require_relative '../spec_helper'

require_relative '../../lib/profile'
require_relative '../../lib/profile_collection'

describe 'ProfileCollection' do
  subject { FactoryGirl.build(:profile_collection, profiles: [profile1, profile2, profile3, profile4]) }
  let(:profile1) { FactoryGirl.build(:profile, last_name: 'ABC', first_name: 'GHI') }
  let(:profile2) { FactoryGirl.build(:profile, last_name: 'ABC', first_name: 'DEF') }
  let(:profile3) { FactoryGirl.build(:profile, last_name: 'XYZ', first_name: 'ABC') }
  let(:profile4) { FactoryGirl.build(:profile, last_name: 'XYZ', first_name: 'DEF') }


  it "should have a setter for profiles" do
    expect(subject).to respond_to("profiles=")
  end

  it "should have a getter for profiles" do
    expect(subject).to respond_to("profiles")
  end

  describe '#initialize' do
    it 'defaults profiles to an empty array' do
      profile_collection = ProfileCollection.new
      expect(profile_collection.profiles).to eq ([])
    end

    it 'set profiles to the passed array when one is given' do
      test_array = ['test', 'array']
      profile_collection = ProfileCollection.new(test_array)
      expect(profile_collection.profiles).to eq (test_array)
    end
  end

  describe 'sort!' do
    it 'defaults to sorting by last_name in descending order' do
      expect(subject.sort!).to eq([profile3, profile4, profile1, profile2])
    end
    it 'sorts by multiple attributes' do
      expect(subject.sort!(['first_name', 'last_name'])).to eq([profile1, profile4, profile2, profile3])
    end
    it 'sorts in ascending order when specified' do
      expect(subject.sort!(['first_name', 'last_name'], 'ASC')).to eq([profile3, profile2, profile4, profile1])
    end
    it 'sorts in descending order when specified' do
      expect(subject.sort!(['first_name', 'last_name'], 'DESC')).to eq([profile1, profile4, profile2, profile3])
    end
  end
end

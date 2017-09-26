require 'rspec'
require_relative '../spec_helper'

require_relative '../../lib/profile'

describe 'Profile' do
  subject { FactoryGirl.build(:profile) }

  let(:attributes) { FactoryGirl.attributes_for(:profile) }

  it "should have a setter for each attribute" do
    attributes.keys.each do |attribute|
      expect(subject).to respond_to("#{attribute}=")
    end
  end

  it "should have a getter for each attribute" do
    attributes.keys.each do |attribute|
      expect(subject).to respond_to("#{attribute}")
    end
  end

  describe '#initialize' do
    it 'sets all attributes to their cooresponding values from the given hash' do
      profile = Profile.new(attributes)
      expect(profile.last_name).to eq(attributes['last_name'])
      expect(profile.first_name).to eq(attributes['first_name'])
      expect(profile.gender).to eq(attributes['gender'])
      expect(profile.favorite_color).to eq(attributes['favorite_color'])
      expect(profile.date_of_birth).to eq(attributes['date_of_birth'])
    end
  end

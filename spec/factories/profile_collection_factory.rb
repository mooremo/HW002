FactoryGirl.define do
  factory :profile_collection do
    profiles { build_list(:profile, 10) }
  end
end

FactoryGirl.define do
  factory :letter do
    body        'Use the force, Luke'
    created_at { DateTime.new(2000, 01, 01) }
  end
end
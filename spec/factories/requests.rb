require 'faker'

FactoryGirl.define do
  factory :valid_instance do |f|
    f.couse { Faker::Lorem.word }
    f.instructor { Faker::Name.last_name Faker::Name.last_name }
  end
end

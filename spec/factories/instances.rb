require 'faker'

FactoryGirl.define do
  factory :instance do
    course { Faker::Lorem.word }
    instructor { Faker::Name.last_name Faker::Name.last_name }
  end

  factory :inavlid_instance do
    course nil
  end
end

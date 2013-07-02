require 'faker'

FactoryGirl.define do
  factory :instance do |f|
    f.course { Faker::Lorem.word }
    f.instructor { Faker::Name.last_name Faker::Name.last_name }
  end

end

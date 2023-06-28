FactoryBot.define do
  factory :event do
    title       { Faker::Lorem.sentence }
    catch_copy  { Faker::Lorem.sentence }
    concept     { Faker::Lorem.sentence }    
    price       { Faker::Number.between(from: 300, to: 9_999_999) }
    address     { Faker::Lorem.sentence }
    latitude    { 12.3456 }
    longitude   { 123.456 }
    association :user

    after(:build) do |event|
      event.images.attach(io: File.open('spec/factories/sample.jpg'), filename: 'sample.jpg')
    end
  end
end

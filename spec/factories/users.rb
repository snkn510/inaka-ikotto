FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    name                  { Faker::Name.name }
    occupation            { Faker::Lorem.sentence }
    language              { Faker::Lorem.sentence }
    profile               { Faker::Lorem.sentence }
    avatar                { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/factories/sample.jpg')) }
  end
end
FactoryBot.define do
  factory :course do
    name { Faker::Name.name }
    uuid  { Faker::Internet.uuid }
    description { Faker::Lorem.paragraphs }
    video_id { Faker::IDNumber.brazilian_id }
    source_code { Faker::Internet.url }
  end
end
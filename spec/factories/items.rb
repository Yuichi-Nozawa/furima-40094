FactoryBot.define do
  factory :item do
    name             { Faker::Lorem.characters(number: 10) }
    explanation      { Faker::Lorem.sentence[0, 50] }
    category_id      { Faker::Number.between(from: 2, to: 10) }
    status_id        { Faker::Number.between(from: 2, to: 10) }
    delivery_cost_id { Faker::Number.between(from: 2, to: 10) }
    region_id        { Faker::Number.between(from: 2, to: 10) }
    delivery_day_id  { Faker::Number.between(from: 2, to: 10) }
    price            { Faker::Number.between(from: 300, to: 9999999) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user, factory: :user
  end
end

FactoryBot.define do
  factory :purchase_record_address do
    post_code { '123-4567' }
    region_id { Faker::Number.between(from: 2, to: 48) }
    city { '東京都' }
    street_address { '1丁目' }
    building { '東京ビル' }
    phone_number { '1111111111' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end

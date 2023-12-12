FactoryBot.define do
  factory :purchase_record do
    association :user, factory: :user
    association :item, factory: :item
  end
end

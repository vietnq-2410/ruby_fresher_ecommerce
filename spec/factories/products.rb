FactoryBot.define do
  factory :product do
    category_id {Faker::Number.within(range: 1..10)}
    name {Faker::Device.model_name}
    price {Faker::Number.number(digits: 10)}
  end
end
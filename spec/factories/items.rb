FactoryBot.define do
  factory :item do
    title       {Faker::Company.name}
    price       {Faker::Number.between(from: 300, to: 9999999)}
    explanation {Faker::Company.catch_phrase}
    category_id {Faker::Number.between(from: 2, to: 11)}
    status_id   {Faker::Number.between(from: 2, to: 7)}
    delivery_id {Faker::Number.between(from: 2, to: 3)}
    region_id   {Faker::Number.between(from: 2, to: 48)}
    mean_id     {Faker::Number.between(from: 2, to:4)}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/test_image.png'), filename: 'test_image.png')
    end
  end
end
FactoryBot.define do
  factory :purchase do
    token      {"tok_abcdefghijk00000000000000000"}
    pos_code   {"123-4567"}
    region_id  {Faker::Number.between(from: 2, to: 48)}
    city       {Faker::Address.city}
    numbering  {Faker::Address.street_address}
    building   {"ABC Building"}
    tel_number {Faker::Number.leading_zero_number(digits: 11)}
  end
end

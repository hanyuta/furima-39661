FactoryBot.define do
  factory :order do
    postal_code    {"111-1111"}
    prefecture_id  {2}
    city           {Faker::Address.city}
    address        {Faker::Address.street_address}
    phone_number   {11111111111}
    token          {"tok_abcdefghijk00000000000000000"}
    association :bought_record
  end
end

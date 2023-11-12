FactoryBot.define do
  factory :shipping_address do
    postal_code    {Faker::Address.postcode}
    prefecture_id  {2}
    city           {Faker::Address.city}
    address        {Faker::Address.address}
    building       {Faker::Address.building}
    phone_number   {Faker::PhoneNumber.phone_number}
    association :bought_record
  end
end

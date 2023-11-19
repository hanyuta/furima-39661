FactoryBot.define do
  factory :order do
    postal_code    { '111-1111' }
    prefecture_id  { 2 }
    city           { Faker::Address.city }
    address        { Faker::Address.street_address }
    building       { 'testハイツ' }
    phone_number   { 11_111_111_111 }
    token          { 'tok_abcdefghijk00000000000000000' }
  end
end

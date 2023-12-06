FactoryBot.define do
  factory :order do
    postal_code   {'123-4567'}
    prefecture_id { 2 }
    city          {'市区町村'}
    addresses     {'番地1-1'}
    home_name     {'建物名'}
    phone_number  {'12345678910'}
    token         {"tok_abcdefghijk00000000000000000"}

  end
end

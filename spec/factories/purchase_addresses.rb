FactoryBot.define do
  factory :purchase_address do
    token {"tok_abcdefghijk00000000000000000"}
    post_code { '123-4567' }
    shipping_area_id {2}
    city_name { '東京都' }
    street_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number {'08084849944'}
  end
end

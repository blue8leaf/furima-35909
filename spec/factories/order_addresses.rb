FactoryBot.define do
  factory :order_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-4567' }
    prefectures_id { 2 }
    municipalities { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    telephone_number { '09012345678' }
  end
end

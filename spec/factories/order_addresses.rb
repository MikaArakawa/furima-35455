FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture { 10 }
    city { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    phone { '09011111111' }
    token { 'tok_abcdefghijk00000000000000000' }
    item_id { '1' }
  end
end

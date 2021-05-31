FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture { 1 }
    city { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    price { 2000 }
  end
end

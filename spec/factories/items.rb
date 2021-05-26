FactoryBot.define do
  factory :item do
    title                    { 'title' }
    description              { 'description' }
    price                    { '300' }
    status_id                { '2' }
    category_id              { '2' }
    shipping_charge_id       { '2' }
    prefecture_id            { '2' }
    shipping_date_id         { '2' }
  end
end

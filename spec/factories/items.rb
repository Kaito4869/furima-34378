FactoryBot.define do
  factory :item do
    title {"鉛筆"}
    description {"鉛筆です"}
    category_id {2}
    state_id {2}
    price {500}
    fee_id {2}
    area_id {2}
    item_date_id {2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'apple-touch-icon.png')
    end
  end
end

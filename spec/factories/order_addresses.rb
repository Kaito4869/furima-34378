FactoryBot.define do
  factory :order_address do
    token {"tok_abcdefghijk00000000000000000"}
    zip_code {'598-0012'}
    area_id {28}
    city {'泉佐野市'}
    address {'高松東2-10-14'}
    building_name {'柳ビル103'}
    telephone_number {'08053814630'}
  end
end

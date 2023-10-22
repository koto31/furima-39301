FactoryBot.define do
  factory :order do
    postal_code {'123-4567'}
    item_prefecture_id {5}
    city {'横浜市緑区'}
    addresses {'青山1-1-1'}
    building {'柳ビル103'}
    phone_number {'09012345678'}
    token {"tok_abcdefghijk00000000000000000"}
    association :user_id
    association :item_id
  end
end

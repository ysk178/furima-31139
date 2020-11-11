FactoryBot.define do
  factory :order_address do
    postal_code { 123-4567 }
    prefecture_id { 15 }
    municipality { "横浜市緑区" }
    address { "青山1-1-1" }
    building { "柳ビル103" }
    phone_number { }
  end
end
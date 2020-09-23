FactoryBot.define do
  factory :purchase_delivery do
    postal_code { 111 - 1111 }
    shipping_area_id { 2 }
    municipalities { 'さいたま市' }
    address { '大宮1-1' }
    phone_number { '08011112222' }
  end
end

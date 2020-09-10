FactoryBot.define do
  factory :item do
    name { 'テスト' }
    explanation { 'テスト' }
    category_id { 2 }
    bland_id { 2 }
    shipping_id { 2 }
    shipping_area { 2 }
    shipping_date { 2 }
    price { 1000 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

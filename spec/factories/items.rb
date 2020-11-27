FactoryBot.define do
  factory :item do
    name { "商品" }
    introduction {Faker::Lorem.sentence}
    category_id { 2 }
    item_condition_id { 2 }
    postage_payer_id { 2 }
    prefecture_code_id { 2 }
    preparation_day_id { 2 }
    price { 1000 }
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

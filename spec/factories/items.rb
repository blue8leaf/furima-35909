FactoryBot.define do
  factory :item do
    item_name{ Faker::Lorem.sentence }
    explanation { Faker::Lorem.sentence }
    category_id { Category.find_by(name: 'レディース').id }
    status_id { Status.find_by(name: '新品・未使用').id }
    delivery_price_id { DeliveryPrice.find_by(name: '未払い(購入者負担)').id }
    prefectures_id { Prefectures.find_by(name: '北海道').id }
    send_day_id { SendDay.find_by(name: '1~2日で発送').id }
    price { 300 }
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

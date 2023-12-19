FactoryBot.define do
  factory :item do
    price                 { Faker::Number.between(from: 300, to: 9999999)}
    category_id           { Faker::Number.between(from: 2, to: 10) }
    item_title            {'テスト'}
    item_description      {'テスト'}
    condition_id          { Faker::Number.between(from: 2, to: 6) }
    shipping_cost_id      { Faker::Number.between(from: 2, to: 3) }
    prefecture_id         { Faker::Number.between(from: 2, to: 48) } 
    shipping_date_id      { Faker::Number.between(from: 2, to: 4) }

    user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end

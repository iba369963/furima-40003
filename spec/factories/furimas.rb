FactoryBot.define do
  factory :furima do
    after(:build) do |furima|
      furima.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    name                        {'Example Product'}
    info                        {'This is an example product description.'}
    category_id                 { 2 }
    sales_status_id             { 2 }
    shipping_fee_status_id      { 2 }
    prefecture_id               { 2 }
    scheduled_delivery_id       { 2 }
    price                       { 500 }
    association :user
  end
end
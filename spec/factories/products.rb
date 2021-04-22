FactoryBot.define do
  factory :product do
    name                  {'name'}
    introduction          {'あいうえお'}
    category_id           {0}
    condition_id          {0}
    shipping_charge_id    {0}
    prefecture_id         {0}
    day_to_ship_id        {0}
    selling_price         {1000}
    association :user
    after(:build) do |product|
      product.image.attach(io: File.open('public/images/flag.png'), filename: 'flag.png')
    end
  end
end
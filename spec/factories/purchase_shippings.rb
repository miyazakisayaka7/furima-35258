FactoryBot.define do
  factory :purchase_shipping do
    prefecture_id{2}
    city{'東京都'}
    house_number{'東京ハイツ'}
    phone_number{'00000000000'}
    postal_code{'000-0000'}
    association :user, :product, :token 
  end
end

FactoryBot.define do
  factory :purchase_shipping do
    prefecture_id{2}
    city{'東京都'}
    house_number{'000'}
    phone_number{'00000000000'}
    postal_code{'000-0000'}
    token {'token000000000'}
    building_name {'東京ハイツ'}
  end
end

require 'rails_helper'
RSpec.describe PurchaseShipping, type: :model do
  describe '商品購入機能' do
  before do
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product)
    @purchase_shipping = FactoryBot.build(:purchase_shipping, user_id: user.id, product_id: product.id)
    sleep 0.2
  end
  
    context '内容に問題がない場合' do
      it '全てが正常の場合' do
        expect(@purchase_shipping).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号がないと購入できない' do
        @purchase_shipping.postal_code = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号の保存にはハイフンが必要である' do
        @purchase_shipping.postal_code = '0000000'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postal code Input correctly")
      end

      it '都道府県が１では購入できない' do
        @purchase_shipping.prefecture_id = 1
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Prefecture Select")
      end

      it '市区町村がないと購入できない' do
        @purchase_shipping.city = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("City can't be blank")
      end

      it '番地がないと購入できない' do
        @purchase_shipping.house_number = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("House number can't be blank")
      end

      it '電話番号がないと購入できない' do
        @purchase_shipping.phone_number = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号は11桁以内の数値出ないと購入できない' do
        @purchase_shipping.phone_number = '00000000000000'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number Input only number")
      end

      it 'tokenが紐付いていないと購入できない' do
        @purchase_shipping.token = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include()
      end

      it 'userが紐付いていないと購入できない' do
        @purchase_shipping.user_id = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("User can't be blank")
      end

      it 'productが紐付いていないと購入できない' do
        @purchase_shipping.product_id = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end

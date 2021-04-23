require 'rails_helper'
RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end
  describe '商品出品機能' do
    context '内容に問題がない場合' do
      it "全てが正常の場合" do
        expect(@product).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'imageがないと保存できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名がないと保存できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
    
      it '商品の説明がないと保存できない' do
        @product.introduction = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Introduction can't be blank")
      end
    
      it 'カテゴリーの情報がないと保存できない' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態についての情報がないと保存できない' do
        @product.condition_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition can't be blank")
      end
    
      it '配送料の負担についての情報がないと保存できない' do
        @product.shipping_charge_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping charge can't be blank")
      end
    
      it '発送元の地域についての情報がないと保存できない' do
        @product.prefecture_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end
    
      it '発送までの日数についての情報がないと保存できない' do
        @product.day_to_ship_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Day to ship can't be blank")
      end
    
      it '販売価格についての情報がないと保村できない' do
        @product.selling_price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Selling price can't be blank")
      end

      it '販売価格は、¥300~¥9,999,999の間でないと保存できない' do
        @product.selling_price = '200'
        @product.valid?
        expect(@product.errors.full_messages).to include("Selling price must be greater than or equal to 300")
      end

      it '販売価格は半角数字でないと保存できない' do
        @product.selling_price = '１１１１'
        @product.valid?
        expect(@product.errors.full_messages).to include('Selling price is not a number')
      end

      it '販売価格は半角英字だと登録できない' do
        @product.selling_price = 'AAAA'
        @product.valid?
        expect(@product.errors.full_messages).to include("Selling price is not a number")
      end

      it 'userが紐付いていないと保存できないこと' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('User must exist')
      end

      it 'condition_idが1だと登録できない' do
        @product.condition_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition must be other than 1")
      end

      it 'category_idが1だと登録できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category must be other than 1")
      end

      it 'day_to_ship_idが1だと登録できない' do
        @product.day_to_ship_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Day to ship must be other than 1")
      end

      it 'prefecture_idが1だと登録できない' do
        @product.prefecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'shipping_charge_idが1だと登録できない' do
        @product.shippng_charge_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping charge must be other than 1")
      end

    end
  end
end

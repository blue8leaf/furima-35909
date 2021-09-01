require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品の作成' do
    context '商品を出品できる場合' do
      it '全ての項目の入力が存在すれば出品できること' do
        expect(@item).to be_valid
      end
      it '価格が半角数値であれば登録できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
    end
    context '商品を出品できない場合' do
      it '画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品の説明がないと出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーがないと出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態がないと出品できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '配送料の負担がないと出品できない' do
        @item.delivery_price_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery price can't be blank")
      end
      it '都道府県がないと出品できない' do
        @item.prefectures_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures can't be blank")
      end
      it '発送までの日数がないと出品できない' do
        @item.send_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Send day can't be blank")
      end
      it '価格がないと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が¥300より少ないときは出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格が¥9,999,999のより多いときは出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '価格は全角数値では出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'ユーザーが紐付いていないとツイートは出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end

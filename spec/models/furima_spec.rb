require 'rails_helper'

RSpec.describe Furima, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @furima = FactoryBot.build(:furima, user_id: @user.id)
  end

  describe '商品出品' do

    #正常系
    context '商品出品できるとき' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@furima).to be_valid
      end
    end

    #異常系
    context '商品出品できないとき' do
      it 'imageが空では登録できない' do
        @furima.image = nil
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Image can't be blank"
      end
      it 'nameが空では登録できない' do
        @furima.name = ''
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Name can't be blank"
      end
      it 'infoが空では登録できない' do
        @furima.info = ''
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Info can't be blank"
      end
      it 'category_idが1では登録できない' do
        @furima.category_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Category must be other than 1"
      end
      it 'sales_status_idが1では登録できない' do
        @furima.sales_status_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Sales status must be other than 1"
      end
      it 'shipping_fee_status_idが1では登録できない' do
        @furima.shipping_fee_status_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Shipping fee status must be other than 1"
      end
      it 'prefecture_idが1では登録できない' do
        @furima.prefecture_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Prefecture must be other than 1"
      end
      it 'scheduled_delivery_idが1では登録できない' do
        @furima.scheduled_delivery_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Scheduled delivery must be other than 1"
      end
      it 'priceが空では登録できない' do
        @furima.price = ''
        @furima.valid?
        expect(@furima.errors.full_messages).to include "Price can't be blank"
      end
    end
  end
end
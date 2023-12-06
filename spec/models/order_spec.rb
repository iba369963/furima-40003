require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @furima = FactoryBot.create(:furima, user_id: @user.id)
    @order = FactoryBot.build(:order, furima_id: @furima.id, user_id: @user.id)
  end

  describe '商品購入' do

    #正常系
    context '商品購入できるとき' do
      it '全ての項目が入力されていれば購入できる' do
        expect(@order).to be_valid
      end
      it '建物名が空でも購入できる' do
        @order.home_name = ''
        expect(@order).to be_valid
      end
    end

    #異常系
    context '商品購入できないとき' do
      it '郵便番号が空では商品購入できない' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Postal code can't be blank"
      end
      it '郵便番号が半角のハイフンを含んだ正しい形式でないと商品購入できない' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include "Postal code は「3桁ハイフン4桁」の形式で入力してください"
      end
      it 'prefecture_idが1では登録できない' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include "Prefecture must be other than 1"
      end
      it 'cityが空では商品購入できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "City can't be blank"
      end
      it 'addressesが空では商品購入できない' do
        @order.addresses = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Addresses can't be blank"
      end
      it 'phone_numberが空では商品購入できない' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberが10桁以上11桁以内の半角数値のみでなければ商品購入できない' do
        @order.phone_number = '090-1234-5678'
        @order.valid?
        expect(@order.errors.full_messages).to include "Phone number は10桁以上11桁以内の半角数値で入力してください"
      end
      it 'phone_numberが10桁以上11桁以内の半角数値のみでなければ商品購入できない' do
        @order.phone_number = '1345678'
        @order.valid?
        expect(@order.errors.full_messages).to include "Phone number は10桁以上11桁以内の半角数値で入力してください"
      end
      it 'phone_numberが10桁以上11桁以内の半角数値のみでなければ商品購入できない' do
        @order.phone_number = '123456789101112'
        @order.valid?
        expect(@order.errors.full_messages).to include "Phone number は10桁以上11桁以内の半角数値で入力してください"
      end
      it 'phone_numberが10桁以上11桁以内の半角数値のみでなければ商品購入できない' do
        @order.phone_number = '123asd789qw'
        @order.valid?
        expect(@order.errors.full_messages).to include "Phone number は10桁以上11桁以内の半角数値で入力してください"
      end
      it "tokenが空では登録できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では商品購入できない' do
        @order.user_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "User can't be blank"
      end
      it 'furima_idが空では商品購入できない' do
        @order.furima_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Furima can't be blank"
      end
    end
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    context 'when creating a new user' do
      it 'is valid with valid attributes' do
        user = User.new(
          nickname: 'testuser',
          email: 'test@example.com',
          password: 'password123',
          password_confirmation: 'password123',
          last_name: '山田',
          first_name: '太郎',
          last_name_kana: 'ヤマダ',
          first_name_kana: 'タロウ',
          birth_date: Date.new(2000, 1, 1)
        )
        expect(user).to be_valid
      end

      it 'is not valid without a nickname' do
        user = User.new(
          email: 'test@example.com',
          password: 'password123',
          password_confirmation: 'password123',
          last_name: '山田',
          first_name: '太郎',
          last_name_kana: 'ヤマダ',
          first_name_kana: 'タロウ',
          birth_date: Date.new(2000, 1, 1)
        )
        user.valid?
        expect(user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'is not valid without an email' do
        user = User.new(
          nickname: 'testuser',
          password: 'password123',
          password_confirmation: 'password123',
          last_name: '山田',
          first_name: '太郎',
          last_name_kana: 'ヤマダ',
          first_name_kana: 'タロウ',
          birth_date: Date.new(2000, 1, 1)
        )
        user.valid?
        expect(user.errors.full_messages).to include("Email can't be blank")
      end

      it 'is not valid without an password' do
        user = User.new(
          nickname: 'testuser',
          email: 'test@example.com',
          password_confirmation: 'password123',
          last_name: '山田',
          first_name: '太郎',
          last_name_kana: 'ヤマダ',
          first_name_kana: 'タロウ',
          birth_date: Date.new(2000, 1, 1)
        )
        user.valid?
        expect(user.errors.full_messages).to include("Password can't be blank")
      end

      it 'is not valid without an password_confirmation' do
        user = User.new(
          nickname: 'testuser',
          email: 'test@example.com',
          password: 'password123',
          last_name: '山田',
          first_name: '太郎',
          last_name_kana: 'ヤマダ',
          first_name_kana: 'タロウ',
          birth_date: Date.new(2000, 1, 1)
        )
        user.valid?
        expect(user.errors.full_messages).to include("Password confirmation can't be blank")
      end

      it 'is not valid without an last_name' do
        user = User.new(
          nickname: 'testuser',
          email: 'test@example.com',
          password: 'password123',
          password_confirmation: 'password123',
          first_name: '太郎',
          last_name_kana: 'ヤマダ',
          first_name_kana: 'タロウ',
          birth_date: Date.new(2000, 1, 1)
        )
        user.valid?
        expect(user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'is not valid without an first_name' do
        user = User.new(
          nickname: 'testuser',
          email: 'test@example.com',
          password: 'password123',
          password_confirmation: 'password123',
          last_name: '山田',
          last_name_kana: 'ヤマダ',
          first_name_kana: 'タロウ',
          birth_date: Date.new(2000, 1, 1)
        )
        user.valid?
        expect(user.errors.full_messages).to include("First name can't be blank")
      end

      it 'is not valid without an last_name_kana' do
        user = User.new(
          nickname: 'testuser',
          email: 'test@example.com',
          password: 'password123',
          password_confirmation: 'password123',
          last_name: '山田',
          first_name: '太郎',
          first_name_kana: 'タロウ',
          birth_date: Date.new(2000, 1, 1)
        )
        user.valid?
        expect(user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'is not valid without an first_name_kana' do
        user = User.new(
          nickname: 'testuser',
          email: 'test@example.com',
          password: 'password123',
          password_confirmation: 'password123',
          last_name: '山田',
          first_name: '太郎',
          last_name_kana: 'ヤマダ',
          birth_date: Date.new(2000, 1, 1)
        )
        user.valid?
        expect(user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'is not valid without an birth_date' do
        user = User.new(
          nickname: 'testuser',
          email: 'test@example.com',
          password: 'password123',
          password_confirmation: 'password123',
          last_name: '山田',
          first_name: '太郎',
          last_name_kana: 'ヤマダ',
          first_name_kana: 'タロウ',
        )
        user.valid?
        expect(user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
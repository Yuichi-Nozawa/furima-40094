require 'rails_helper'

RSpec.describe Address, type: :model do
  describe '配送先入力' do
    before do
      
      @address = FactoryBot.build(:address)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @address.post_code = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Address can't be blank")
      end
      it 'post_codeは「3桁ハイフン4桁」でないと保存できないこと' do
        @address.post_code = '1234-5678'
        @address.valid?
        expect(@address.errors.full_messages).to include("エラー名")
      end
      it 'region_idは2~48であること' do
        @address.region_id = '1'
        @address.valid?
        expect(@address.errors.full_messages).to include("エラー名")
      end
      it 'cityが空だと保存できないこと' do
        @address.city = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("City can't be blank")
      end
      it 'street_addressが空だと保存できないこと' do
        @address.street_address = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Street address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @address.phone_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは10桁以上の半角数値でなければ保存できないこと' do
        @address.phone_number = '111111111'
        @address.valid?
        expect(@address.errors.full_messages).to include("エラー名")
      end
      it 'phone_numberは11桁以内の半角数値でなければ保存できないこと' do
        @address.phone_number = '111111111111'
        @address.valid?
        expect(@address.errors.full_messages).to include("エラー名")
      end
    end
  end
end

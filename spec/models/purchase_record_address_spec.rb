require 'rails_helper'

RSpec.describe PurchaseRecordAddress, type: :model do
  describe '配送先入力' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_record_address = FactoryBot.build(:purchase_record_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_record_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @purchase_record_address.post_code = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeは「3桁ハイフン4桁」でないと保存できないこと' do
        @purchase_record_address.post_code = '1234-5678'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'region_idは2~48であること' do
        @purchase_record_address.region_id = '1'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Region can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @purchase_record_address.city = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("City can't be blank")
      end
      it 'street_addressが空だと保存できないこと' do
        @purchase_record_address.street_address = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Street address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @purchase_record_address.phone_number = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは10桁以上の半角数値でなければ保存できないこと' do
        @purchase_record_address.phone_number = '111111111'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
      end
      it 'phone_numberは11桁以内の半角数値でなければ保存できないこと' do
        @purchase_record_address.phone_number = '111111111111'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it 'tokenが空だと保存できないこと' do
        @purchase_record_address.token = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空だと保存できないこと' do
        @purchase_record_address.user_id = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できないこと' do
        @purchase_record_address.item_id = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end

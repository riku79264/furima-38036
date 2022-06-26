require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      item.image = fixture_file_upload('public/image/output-image1.png')
      item.save
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
      sleep 0.1
  end

  describe '商品購入機能' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'トークンがないと保存できないこと' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空だと保存できないこと' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_address.post_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'shipping_area_idを選択していないと保存できないこと' do
        @purchase_address.shipping_area_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'city_nameが空だと保存できないこと' do
        @purchase_address.city_name = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City name can't be blank")
      end
      it 'street_numberが空だと保存できないこと' do
        @purchase_address.street_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Street number can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9桁以下だと保存できないこと' do
        @purchase_address.phone_number = '090123123'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number Phone number is too short")
      end
      # it 'phone_numberが12桁以上だと保存できないこと' do
      #   @purchase_address.phone_number = '090123123123'
      #   @purchase_address.valid?
      #   expect(@purchase_address.errors.full_messages).to include("Phone number Phone number is too long")
      # end
      it 'phone_numberが全角だと保存できないこと' do
        @purchase_address.phone_number = '１１１２２２３３３４'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number Half-width number")
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end  
end

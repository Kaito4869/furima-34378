require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @orderAddress = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
    sleep 1
  end

  describe '商品購入' do
    context '商品が購入できるとき' do
      it 'token,zip_code,area_id,city,address,telephone_numberが存在すれば購入できる' do
        expect(@orderAddress).to be_valid
      end
      it '建物名の記入がくても登録できる' do
        @orderAddress.building_name = ''
        expect(@orderAddress).to be_valid
      end
    end
    context '商品が購入できないとき' do
      it 'tokenが空では購入できない' do
        @orderAddress.token = nil
        @orderAddress.valid?
        expect(@orderAddress.errors.full_messages).to include("Token can't be blank")
      end
      it 'zip_codeが空では購入できない' do
        @orderAddress.zip_code = ''
        @orderAddress.valid?
        expect(@orderAddress.errors.full_messages).to include("Zip code can't be blank")
      end
      it 'area_idが空では購入できない' do
        @orderAddress.area_id = ''
        @orderAddress.valid?
        expect(@orderAddress.errors.full_messages).to include("Area can't be blank")
      end
      it 'cityが空では購入できない' do
        @orderAddress.city = ''
        @orderAddress.valid?
        expect(@orderAddress.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では購入できない' do
        @orderAddress.address = ''
        @orderAddress.valid?
        expect(@orderAddress.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberが空では購入できない' do
        @orderAddress.telephone_number = ''
        @orderAddress.valid?
        expect(@orderAddress.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'zip_codeはハイフンがないと購入できない' do
        @orderAddress.zip_code = '1234567'
        @orderAddress.valid?
        expect(@orderAddress.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
      end
      it 'zip_codeは「3桁の半角数字 - 4桁の半角数字」出ないと購入できない' do
        @orderAddress.zip_code = '１２３４ - ５６７'
        @orderAddress.valid?
        expect(@orderAddress.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
      end
      it 'area_idが0では購入できない' do
        @orderAddress.area_id = 0
        @orderAddress.valid?
        expect(@orderAddress.errors.full_messages).to include("Area can't be blank")
      end
      it 'telephone_numberが半角数字だけでないと購入できない' do
        @orderAddress.telephone_number = '０８０abcd４６３０'
        @orderAddress.valid?
        expect(@orderAddress.errors.full_messages).to include("Telephone number is invalid.")
      end
      it 'telephone_numberが全角数字だと購入できない' do
        @orderAddress.telephone_number = '０８０５３８１４６３０'
        @orderAddress.valid?
        expect(@orderAddress.errors.full_messages).to include("Telephone number is invalid.")
      end
      it 'telephone_numberが12桁以上だと購入できない' do
        @orderAddress.telephone_number = '08012345678910'
        @orderAddress.valid?
        expect(@orderAddress.errors.full_messages).to include("Telephone number is invalid.")
      end
      it 'user_idが空では購入できない' do
        @orderAddress.user_id = ''
        @orderAddress.valid?
        expect(@orderAddress.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では購入できない' do
        @orderAddress.item_id = ''
        @orderAddress.valid?
        expect(@orderAddress.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
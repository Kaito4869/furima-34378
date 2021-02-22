require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @orderAddress = FactoryBot.build(:order_address)
  end

  describe '商品購入' do
    context '商品が購入できるとき' do
      it 'token,zip_code,area_id,city,address,telephone_numberが存在すれば購入できる' do
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
    end
  end
end
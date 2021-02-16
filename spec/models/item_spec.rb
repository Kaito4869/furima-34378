require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品保存' do
    context '商品が保存できるとき' do
      it 'image,title,desciption,category_id,state_id,price,fee_id,area_id,item_dateが存在すれば登録できる' do
        @expect(@item).to be_valid
      end
      it 'titleが40文字以下であれば登録できる' do
        @item.title = '鉛筆'
        expect(@item).to be_valid
      end
      it 'descriptionが1000文字以下なら登録できる' do
        @item.description = '鉛筆です。'
        expect(@item).to be_valid
      end
      it 'priceが300以上なら登録できる' do
        @item.price = '500'
        @item.valid?
        expect(@item).to be_valid
      end
      it 'priceが9999999以下なら登録できる' do
        @item.price = '1000000'
        @item.valid?
        expect(@item).to be_valid
      end
      it 'priceが半角数字なら登録できる' do
        @item.price = "500"
        @item.valid?
        expect(@item).to be_valid
      end
    end
    context '商品が保できないとき' do
      it 'imageが空では登録できない' do
        @item.image = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'titleが空では登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category id can't be blank")
      end
      it 'state_idが空では登録できない' do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("State id can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'fee_idが空では登録できない' do
        @item.fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee id can't be blank")
      end
      it 'area_idが空では登録できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area id can't be blank")
      end
      it 'item_dateが空では登録できない' do
        @item.item_date = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item date can't be blank")
      end
      it 'category_idが[1]では登録できない' do
        @item.category_id = '[1]'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category id is invalid")
      end
      it 'state_idが[1]では登録できない' do
        @item.state_id = '[1]'
        @item.valid?
        expect(@item.errors.full_messages).to include("State id is invalid")
      end
      it 'fee_idが[1]では登録できない' do
        @item.fee_id = '[1]'
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee id is invalid")
      end
      it 'area_idが[1]では登録できない' do
        @item.area_id = '[1]'
        @item.valid?
        expect(@item.errors.full_messages).to include("Area id is invalid")
      end
      it 'item_date_idが[1]では登録できない' do
        @item.item_date_id = '[1]'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item date id is invalid")
      end
      it 'priceが299以下なら登録できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'priceが10000000以上なら登録できない' do
        @item.price = 10000000
        @irem.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'priceが半角数字でなければ登録できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'priceが半角英数字混合では登録できない' do
        @item.price = 'a50'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'priceが半角英語だけでは登録できない' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
    end 
  end
end

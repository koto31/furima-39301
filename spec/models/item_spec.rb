require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品ができる場合' do
      it '必要事項を全て過不足なく入力すると出品できる' do
        expect(@user).to be_valid
      end
    end
    context '商品出品ができない場合' do
     it 'item_iamgeが空では出品できない' do
        @item.image = nil
        item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
     it 'item_nameが空では出品できない' do
       @item.item_name = nil
       item.valid?
       expect(@item.errors.full_messages).to include("item_name can't be blank")
     end
     it 'item_infoが空では出品できない' do
       @item.item_info = nil
       item.valid?
       expect(@item.errors.full_messages).to include("item_info can't be blank")
     end
     it 'item_categoryが空では出品できない' do
       @item.item_category = nil
       item.valid?
       expect(@item.errors.full_messages).to include("item_category can't be blank")
     end
     it 'item_sales_statusが空では出品できない' do
       @item.item_sales_status = nil
       item.valid?
       expect(@item.errors.full_messages).to include("item_sales_status can't be blank")
     end
     it 'item_shipping_fee_statusが空では出品できない' do
       @item.item_shipping_fee_status = nil
       item.valid?
       expect(@item.errors.full_messages).to include("item_shipping_fee_status can't be blank")
     end
     it 'item_prefectureが空では出品できない' do
       @item.item_prefecture = nil
       item.valid?
       expect(@item.errors.full_messages).to include("item_prefecture can't be blank")
     end
     it 'item_scheduled_deliveryが空では出品できない' do
       @item.item_scheduled_delivery = nil
       item.valid?
       expect(@item.errors.full_messages).to include("item_scheduled_delivery can't be blank")
     end
     it 'item_priceが空では出品できない' do
       @item.item_price = nil
       item.valid?
       expect(@item.errors.full_messages).to include("item_price can't be blank") 
     end
    end
  end  
end

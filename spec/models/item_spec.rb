require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品ができる場合' do
      it '必要事項を全て過不足なく入力すると出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品ができない場合' do
     it 'item_iamgeが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
     it 'item_nameが空では出品できない' do
       @item.item_name = nil
       @item.valid?
       expect(@item.errors.full_messages).to include("Item name can't be blank")
     end
     it 'item_infoが空では出品できない' do
       @item.item_info = nil
       @item.valid?
       expect(@item.errors.full_messages).to include("Item info can't be blank")
     end
     it 'item_categoryが未選択では出品できない' do
       @item.item_category_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Item category can't be blank", "Item category must be other than 1")
     end
     it 'item_sales_statusが未選択では出品できない' do
       @item.item_sales_status_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Item sales status can't be blank")
     end
     it 'item_shipping_fee_statusが未選択では出品できない' do
       @item.item_shipping_fee_status_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Item shipping fee status can't be blank", "Item shipping fee status must be other than 1")
     end
     it 'item_prefectureが未選択では出品できない' do
       @item.item_prefecture_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Item prefecture can't be blank", "Item prefecture must be other than 1")
     end
     it 'item_scheduled_deliveryが空では出品できない' do
       @item.item_scheduled_delivery_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Item scheduled delivery can't be blank", "Item scheduled delivery must be other than 1")
     end
     it 'item_priceが空では出品できない' do
       @item.item_price = nil
       @item.valid?
       expect(@item.errors.full_messages).to include("Item price can't be blank", "Item price is not a number", "Item price is not included in the list") 
      end
      it 'priceが300円以下だと出品できない' do
        @item.item_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not included in the list")
      end
      it 'priceが9,999,999円以上だと出品できない' do
        @item.item_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not included in the list")
      end
      it 'priceが半角数字でないと出品できない' do
        @item.item_price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number", "Item price is not included in the list")
      end
      it "priceが半角英数混合では出品できないこと" do
        @item.item_price = "300dollars"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number")
      end
      it "priceが半角英語だけでは出品できないこと" do
        @item.item_price = "threemillion"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number", "Item price is not included in the list")
      end
      it 'ユーザーが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end  
end

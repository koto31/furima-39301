require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '商品購入記録の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order = FactoryBot.build(:order, user_id: @user.id, item_id: @item.id)
    end
  
    context'内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@order).to be_valid
      end
      it '建物名が空でも購入できること' do
        @order.building =''
        expect(@order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号は空では保存できないこと' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号は「3桁ハイフン4桁」半角英数字出ないと保存できないこと' do
        @order.postal_code = '123-1234'
        @order.valid?
        except(@order.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '都道府県が未選択の場合は購入できないこと' do
        @order.item_prefecture_id = '1'
        @order.valid?
        except(@order.errors.full_messages).to include("Item prefecture can't be blank")
      end
      it '市区町村が空だと購入できないこと' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it'番地が空だと購入できないこと' do
        @order.addresses = ''
        @order.valid?
        except(@order.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと購入できないこと' do
        @order.phone_number = nil
        @order.valid?
        except(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が9桁以下だと購入できないこと' do
        @order.phone_number = '090123456'
        @order.valid?
        except(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が12桁以上だと購入できない' do
        @order.phone_number = '090123456789'
        @order.valid?
        except(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が半角数値ではないと購入できないこと' do
        @order.phone_number = '０9012345678'
        @order.valid?
        except(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenが空では購入できないこと' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが紐づいていなければ購入できないこと' do
        @order.user_id = ''
        @order.valid?
        except(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが紐づいていなければ購入できないこと' do
        @order.item_id = ''
        @order.valid?
        except(@order.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end

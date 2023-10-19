class OrdersController < ApplicationController
  #before_action :set_order, only: [:index, :create]
  before_action :authenticate_user!, only: [:index,:create]
  before_action :order, only: [:index, :create]
  def index 
    @order_form = OrderForm.new
    @item = Item.find(params[:item_id])
  end

 def create
   @item = Item.find(params[:item_id])
   @order_form = OrderForm.new(order_params)
   if @order_form.valid?
      pay_item
      @order_form.save(params, current_user.id)
      redirect_to root_path
   else
      render :index
    end
  end


    def order_params
      params.require(:order_form).permit(:postal_code, :item_prefecture_id, :city, :addresses, :building, :phone_number, :token).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end
    
    #def order_params
      #params.require(:order_form).permit(:price).merge(token: params[:token])
    #end

    def order
      @item = Item.find(params[:item_id])
      if   @item.user == current_user || @item.order != nil
        redirect_to root_path
      end
    end
    
    def pay_item
      
      Payjp.api_key = "sk_test_12ec66abcea06951e4f466c9"
      Payjp::Charge.create(
        amount: @item.item_price,
        card: order_params[:token],
        currency: 'jpy'
      )
    end 
    
    def correct_user
      redirect_to(root_path) unless @item.user[:id] == current_user.id
    end

    #def set_order
      #@item = Item.find(params[:item_id])

  end

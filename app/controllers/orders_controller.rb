class OrdersController < ApplicationController
  before_action :set_order, only: [:index, :create]
  before_action :authenticate_user!, only: [:index,:create]
  before_action :order, only: [:index, :create]
  def index 
    @order_form = OrderForm.new
  end

  def create
   @order_form = OrderForm.new(order_params)
   if @order_form.valid?
      pay_item
      @order_form.save(params, current_user.id)
      redirect_to root_path
   else
      render :index
    end
  end

    def set_order
      @item = Item.find(params[:item_id])
    end

    def order_params
      params.require(:order_form).permit(:postal_code, :item_prefecture_id, :city, :addresses, :building, :phone_number, :token).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end
    
    def order
      @item = Item.find(params[:item_id])
      if   @item.user == current_user || @item.order != nil
        redirect_to root_path
      end
    end
    
    def pay_item
      
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.item_price,
        card: order_params[:token],
        currency: 'jpy'
      )
    end 
end
class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :correct_user]
  before_action :correct_user, only: [:edit, :update]
  
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new 
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path  
    else
      render :new
    end
  end

  def show
  end
  
  def edit
  end

  def update
    if  @item.update(item_params)
      redirect_to  item_path
    else
      render :edit
    end
  end


  private
  def item_params
    params.require(:item).permit(:item_name, :item_info, :item_category_id, :item_sales_status_id, :item_shipping_fee_status_id, :item_prefecture_id, :item_scheduled_delivery_id, :item_price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def correct_user
    redirect_to(root_path) unless @item.user[:id] == current_user.id
  end

  def update_params
    params.require(:item).permit(:item_name, :item_info, :item_category_id, :item_sales_status_id, :item_shipping_fee_status_id, :item_prefecture_id, :item_scheduled_delivery_id, :item_price, :image).merge(user_id: current_user.id)
  end

  
end

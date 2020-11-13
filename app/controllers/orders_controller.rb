class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_order, only: :[:index, :create]

  def index
    if current_user.id == @item.user.id || @item.order
      redirect_to root_path
    end
    @order_address = OrderAddress.new
  end
 
  def create
    @order_address = OrderAddress.new(order_params) 
     if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
     else
       render action: :index
     end
  end
 
  private
  def order_params
   params.require(:order_address).permit(
     :postal_code, :prefecture_id, :municipality, :address, :building, :phone_number, :order
    ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_order
    @item = Item.find(params[:item_id])
  end
end
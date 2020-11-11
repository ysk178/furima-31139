class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end
 
  def create
    binding.pry
    @item = Item.find(params[:item_id])
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
     :item_id, :postal_code, :prefecture_id, :municipality, :address, :building, :phone_number, :order
    ).merge(user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_b347117a08ac2e59c6991567"
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
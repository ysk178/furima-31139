class ItemsController < ApplicationController
  before_action :move_to_index, only: [:edit]
  before_action :set_item, only: [:edit, :update, :show, :destroy]

  def index
    @items = Item.order('created_at DESC')
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

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if user_signed_in? && current_user.id == @item.user.id
      @item.destroy
      redirect_to root_path
    else
      redirect_to item_path(@item.id)
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :name, :explanation, :category_id, :status_id, :charge_id, :prefecture_id, :day_id, :price, :image
    ).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    redirect_to action: :index if user_signed_in? && current_user.id != @item.user.id
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

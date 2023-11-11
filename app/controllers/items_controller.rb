class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:edit, :show]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def show
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    unless current_user == User.find(@item.user_id)
      redirect_to action: :index
    end

  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    unless current_user == User.find(@item.user_id)
      redirect_to action: :index
    end
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_info, :item_category_id, :item_sales_status_id, :item_shipping_fee_staus_id,
                                 :prefecture_id, :item_scheduled_delivery_id, :item_price, :item_image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :set_bought, only: [:index, :show, :edit, :delete]

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
    bought_check
    return if check_user

    redirect_to action: :index
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    redirect_to action: :index unless check_user
    @item.destroy
    redirect_to action: :index
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_info, :item_category_id, :item_sales_status_id, :item_shipping_fee_staus_id,
                                 :prefecture_id, :item_scheduled_delivery_id, :item_price, :item_image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def check_user
    current_user.id == @item.user.id
  end

  def set_bought
    @records = BoughtRecord.all
  end

  def bought_check
    @records.each do |bought_record_id|
      if bought_record_id.item.id == @item.id
        redirect_to action: :index
        return
      end
    end
  end
end

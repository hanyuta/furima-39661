class ItemsController < ApplicationController
  def index
  end

  def new
  end

  private

  def item_params
    params.require(:item).permit(:item_name,:item_info,:item_category_id,:item_sales_status_id,:item_shipping_fee_staus_id,:prefecture_id,:item_scheduled_delivery_id,:item_price,:item_image),merge(user_id:current_user.id)
  end
end

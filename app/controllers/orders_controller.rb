class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @shipping_address = ShippingAddress.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render "index",status: :unprocessable_entity
    end

  end

  private

  def order_params
    params.require(:order).permit(:postal_code,:prefecture_id,:city,:address,:phone_number).merge(user_id: current_user.id ,item_id: item_id ,token: params[:token])
  end


end

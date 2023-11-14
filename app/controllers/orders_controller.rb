class OrdersController < ApplicationController
  before_action :authenticate_user! , expect: [:index , :new]
  before_action :set_item ,only: [:index , :order_params]

  def index
    set_item
    @order = Order.new
  end

  def create
    set_item
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
    params.require(:order).permit(:postal_code,:prefecture_id,:city,:address,:building,:phone_number).merge(user_id: current_user.id ,item_id: @item.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end

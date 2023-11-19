class OrdersController < ApplicationController
  before_action :authenticate_user!, expect: [:index, :new]
  before_action :set_item, only: [:index, :order_params]
  before_action :check_user, only: [:index]

  def index
    set_bought
    bought_check
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    set_item
    @order = Order.new
  end

  def create
    set_item
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_bought
    @records = BoughtRecord.all
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.item_price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def bought_check
    @records.each do |bought_record_id|
      if bought_record_id.item.id == @item.id
        redirect_to root_path
        return
      end
    end
  end

  def check_user
    if current_user.id == @item.user.id 
      redirect_to root_path
      return
    end
  end

end

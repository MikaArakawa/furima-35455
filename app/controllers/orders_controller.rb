class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.user_id == current_user.id
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_address_params)

    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_address_params
    params.require(:order_address).permit(:postal_code, :prefecture, :city, :address, :building, :phone).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = 'sk_test_e06ea3357996902f53db119c'
    Payjp::Charge.create(
      amount: @item.price,
      card: order_address_params_params[:token],
      currency: 'jpy'
    )
  end
end

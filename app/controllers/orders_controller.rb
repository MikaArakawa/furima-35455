class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @order_address = OrderAddress.new
    # @item =  定義する必要あり

  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:price, :postal_code, :prefecture, :city, :address, :building, :price, :item_id).merge(user_id: current_user.id, item_id: item.id) 
  end

end
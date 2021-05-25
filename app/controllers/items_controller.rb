class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
  end
      
  private

  def message_params
    params.require(:item).permit(:title, :description, :price, :status_id, :category_id,:shipping_charge_id, :prefecture_id, :shipping_date_id, :image).merge(user_id: current_user.id)
  end

end

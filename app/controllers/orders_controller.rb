class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_send = OrderSend.new
  end

  def create
  end
end

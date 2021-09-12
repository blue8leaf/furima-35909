class OrdersController < ApplicationController
  def index
    @order_send = OrderSend.new
  end

  def create
  end
end

class OrdersController < ApplicationController
  # GET /orders or /orders.json
  def index
    @orders = Order.all
  end
end

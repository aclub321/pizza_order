class OrdersController < ApplicationController
  # GET /orders or /orders.json
  def index
    @orders = Order.incomplete
                   .includes(:promotion_codes, 
                             pizzas: { pizza_ingredients: :ingredient })
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    order = Order.find(params[:id])

    if order.update(complete: true)
      redirect_to orders_url, notice: 'Order was successfully updated.'
    else
      redirect_to orders_url, notice: 'Failed to update order.'
    end
  end
end

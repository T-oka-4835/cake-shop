class Publics::OrdersController < ApplicationController

  def index
  end

  def show
  end

  def new
    @order = Order.new
    @customer = current_customer
    @addresses = Address.all
  end

  def create
  end

  def confirm
    @order = Order.new(order_params)
    @customer = current_customer
    @carts = @customer.carts.all
  end

  def complete
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :shipping_cost, :pay_way, :name, :postcode, :address, :order)
  end

end

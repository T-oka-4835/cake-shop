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
    order = Order.new(order_params)
    if order.save
      redirect_to orders_confirm_path
    end
  end

  def confirm
  end

  def complete
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :shipping_cost, :pay_way, :name, :postcode, :address)
  end


end

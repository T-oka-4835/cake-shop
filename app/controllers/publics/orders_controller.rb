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
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_complete_path
  end

  def confirm
    @order = Order.new(order_params)
    @customer = current_customer
    @carts = @customer.carts.all

    if params[:order][:order] == "0"
      @order.postcode = @customer.postcode
      @order.address = @customer.address
      @order.name = @customer.last_name + @customer.first_name
    elsif params[:order][:order] == "1"
      @address = Address.find(params[:order][:id])
      @order.postcode = @address.postcode
      @order.address = @address.address
      @order.name = @address.name
    else
      @order.postcode = params[:order][:postcode]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end

  end

  def complete
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :shipping_cost, :pay_way, :name, :postcode, :address)
  end

end

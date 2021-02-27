class Publics::OrdersController < ApplicationController

  def index
     @orders = Order.where(customer_id: current_customer.id)
     @total = 0
  end

  def show
  end

  def new
    @order = Order.new
    @customer = current_customer
    @addresses = @customer.addresses
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_complete_path
    @customer = current_customer
    @carts = @customer.carts.all
    @carts.each do |cart|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart.item_id
      @order_detail.price = cart.item.price
      @order_detail.amount = cart.amount
      @order_detail.order_id = @order.id
      @order_detail.save
    end
    current_customer.carts.destroy_all
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
      Adress.create!(customer_id: @customer.id, postcode: @order.postcode, address: @order.address, name: @order.name)
    end

  end

  def complete
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :shipping_cost, :pay_way, :name, :postcode, :address)
  end

end

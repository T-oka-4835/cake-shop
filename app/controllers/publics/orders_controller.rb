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

    if [:orders] == "ご自身の住所"
      @order.postcode = @customer.postcode
      @order.address = @order.address
      @order.last_name + @order.first_name
    elsif [:order] == "登録済住所から選択"
      @order.postcode = @address.postcode
      @order.address = @address.address
      @order.name = @address.name
    else
      @order.postcode = Order.find_by(postcode: @order.postcode)
      @order.address = Order.find_by(address: @order.address)
      @order.name = Order.find_by(name: @order.name)
    end

  end

  def complete
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :shipping_cost, :pay_way, :name, :postcode, :address, :order)
  end

end

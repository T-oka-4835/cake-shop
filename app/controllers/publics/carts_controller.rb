class Publics::CartsController < ApplicationController

  def index
    @carts = Cart.all
  end

  def create
    cart = Cart.new(cart_params)
    cart.save
    redirect_to carts_path
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  private
  def cart_params
    params.require(:cart).permit(:amount)
  end

end

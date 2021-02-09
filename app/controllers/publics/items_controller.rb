class Publics::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart = Cart.new
      if @cart.amount == '個数選択'
        redirect_to item_path(item)
      end
  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :price, :image, :is_status)
  end

end

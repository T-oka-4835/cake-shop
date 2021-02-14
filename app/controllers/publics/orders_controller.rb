class Publics::OrdersController < ApplicationController

  def index
  end

  def show
  end

  def new
    @customer = current_customer
    @addresses = Address.all 
  end

  def create
  end

  def confirm
  end

  def complete
  end

end

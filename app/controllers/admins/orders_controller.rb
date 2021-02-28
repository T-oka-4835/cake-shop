class Admins::OrdersController < ApplicationController
  
  def index 
    @orders = Order
  end 
  
end

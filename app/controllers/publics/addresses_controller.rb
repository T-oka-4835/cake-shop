class Publics::AddressesController < ApplicationController

  def index
    @address = Address.new
    @addresses = Address.all
  end

  def create
  end

  def edit
  end

  def destroy
  end

  def update
  end

end

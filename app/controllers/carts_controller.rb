class CartsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    # @item = Item.find
  end

  def update

  end

  def destroy

  end

end

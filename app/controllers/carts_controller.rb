class CartsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    current_cart = Cart.find_by(id: params[:id])
  end

  def checkout
    current_cart = Cart.find_by(id: params[:id])

    current_cart.line_items.collect do |line_item|
      @item = Item.find_by(id: line_item.item_id)
      @item.inventory = @item.inventory - line_item.quantity
      @item.save
    end
    current_cart = nil
    redirect_to cart_path
  end

  def destroy

  end

end

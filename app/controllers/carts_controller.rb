class CartsController < ApplicationController

  def index
    @items = Item.all
  end

  def create
    @cart = Cart.create
    @cart.user_id = current_user.id
    redirect_to cart_path(@cart)
  end

  def show
    @cart = Cart.find(params[:id])
  end

  def checkout
    @cart = current_user.current_cart
    @cart.line_items.collect do |line_item|
      @item = Item.find_by(id: line_item.item_id)
      @item.inventory = @item.inventory - line_item.quantity
      @item.save
    end
    @cart.status = "submitted"
    @cart = nil
    current_user.current_cart_id = nil
    current_user.save
    redirect_to cart_path
  end

  def destroy

  end

end

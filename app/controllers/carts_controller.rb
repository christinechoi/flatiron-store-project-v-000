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
    # binding.pry
    current_cart = current_user.current_cart

    # current_cart = Cart.find_by(id: params[:id])
  end

  def checkout

    @cart = current_user.current_cart#Cart.find_by(id: params[:id])

    @cart.line_items.collect do |line_item|
      @item = Item.find_by(id: line_item.item_id)
      @item.inventory = @item.inventory - line_item.quantity
      @item.save
    end
    @cart.status = "submitted"

    @cart = nil
    current_user.current_cart_id = nil#somehow current_user.current_cart is not nil
    # binding.pry
    current_user.save
    redirect_to cart_path #carts#show
  end
  
  def destroy

  end

end

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
    # binding.pry
    current_cart = current_user.current_cart#Cart.find_by(id: params[:id])

    current_cart.line_items.collect do |line_item|
      @item = Item.find_by(id: line_item.item_id)
      @item.inventory = @item.inventory - line_item.quantity
      @item.save
    end
    current_cart.status = "submitted"
    current_cart.save
    current_user.current_cart = nil #somehow current_user.current_cart is not nil
    # binding.pry
    redirect_to cart_path #carts#show
  end

  def destroy

  end

end

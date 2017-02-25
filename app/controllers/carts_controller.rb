class CartsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    current_cart = Cart.find_by(id: params[:id])
  end

  def checkout
    redirect_to cart_path
  end

  def destroy

  end

end

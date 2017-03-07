class CartsController < ApplicationController

  def show
    @cart = Cart.find(params[:id])
  end

  def checkout
    @cart = current_user.current_cart
    @cart.checkout
    @cart = nil
    current_user.current_cart_id = nil
    current_user.save
    redirect_to cart_path
  end

end

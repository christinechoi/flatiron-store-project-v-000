class CartsController < ApplicationController

  def show
    @cart = Cart.find(params[:id])
  end

  def checkout
    @cart = current_user.current_cart
    @cart.checkout
    @cart = nil
    current_user.current_cart_id = nil #Passing this test requires setting current_cart to nil. However...
    current_user.save
    redirect_to cart_path #...going to cart_path results in an error.
  end

end

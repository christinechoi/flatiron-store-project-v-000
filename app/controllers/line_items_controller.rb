class LineItemsController < ApplicationController

  def create


    @line_item = LineItem.create(item_id: params[:item_id])
    @line_item.cart_id = current_cart.id
    #current_user.current_cart = Cart.create(user_id: current_user.id, status: 'new')
    # binding.pry
    redirect_to cart_path(current_user.current_cart)
  end


end

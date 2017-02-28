class LineItemsController < ApplicationController

  def create
    @cart = current_user.create_cart
      if @cart.save
        @line_item = LineItem.create(item_id: params[:item_id])
        @line_item.cart_id = current_user.current_cart_id
        redirect_to @cart
      else
        redirect_to store_path
      end
  end


end

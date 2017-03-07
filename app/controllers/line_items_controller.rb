class LineItemsController < ApplicationController

  def create
    @cart = current_user.create_cart
    @cart.user_id = current_user.id

      if @cart.save
        @line_item = @cart.add_item(line_item_params)
        @line_item.cart_id = current_user.current_cart_id
        current_user.save
        @line_item.save
        redirect_to @cart
      else
        redirect_to store_path
      end
  end

private

  def line_item_params
    params.require(:item_id)
  end
end

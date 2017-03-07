class OrdersController < ApplicationController

  def show
    @order = Order.find_by(id: params[:id])
  end
  
end

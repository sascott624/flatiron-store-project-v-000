class LineItemsController < ApplicationController

  def create
    current_cart.add_item(params[:item_id])
    current_cart.save
    redirect_to cart_path(current_cart)
  end

end

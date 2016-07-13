class CartsController < ApplicationController

  def show
    @cart = current_cart
  end

  def checkout
    @cart = Cart.find(params[:id])
    @cart.checkout_items
    redirect_to cart_path(@cart)
  end

end

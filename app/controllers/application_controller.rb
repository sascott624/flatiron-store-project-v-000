class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_cart

  private

  def current_cart
    if current_user && current_user.current_cart
      current_cart = current_user.current_cart
    elsif current_user
      current_cart = Cart.create
      current_cart.user = current_user
      current_user.current_cart = current_cart
      current_user.save
      current_cart.save
    end
    current_cart
  end

end

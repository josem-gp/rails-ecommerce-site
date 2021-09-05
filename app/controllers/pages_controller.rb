class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about ]

  def home
    @products = Product.all
  end

  def about
  end

  def cart
    if current_user
      @order = Order.where(user: current_user, status: 1)[0]
      @cart_items = @order.order_items if @order
    else
      redirect_to new_user_session_path
    end
  end
end

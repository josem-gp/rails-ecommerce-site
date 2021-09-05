class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about, :cart ]

  def home
    @products = Product.all
  end

  def about
  end

  def cart
    @order = Order.where(user: current_user, status: 1)[0]
    @cart_items = @order.order_items
  end
end

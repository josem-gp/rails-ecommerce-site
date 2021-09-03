class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about, :cart ]

  def home
    @products = Product.where(rating: 4).or(Product.where(rating: 5))
  end

  def about
  end

  def cart
  end
end

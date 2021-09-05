class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about, :cart ]

  def home
    @products = Product.all
  end

  def about
  end

  def cart
  end
end

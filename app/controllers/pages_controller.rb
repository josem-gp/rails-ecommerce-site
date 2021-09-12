class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about ]

  def home
    @user = current_user
    @products = Product.all
  end

  def about
    @user = current_user
  end
end

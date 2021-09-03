class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about, :cart ]

  def home
  end

  def about
  end

  def cart
  end
end

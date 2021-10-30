class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about, :create ]

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    begin 
      @contact.deliver
      @user = current_user
      @products = Product.all
      @contact = Contact.new()
      flash[:alert] = "Thank you for your message. We will get back to you soon!"
      render :home
    rescue ArgumentError
      @user = current_user
      @products = Product.all
      flash[:alert] = "Message did not send."
      render :home

    end
  end

  def home
    @contact = Contact.new()
    @user = current_user
    @products = Product.order(sales: :desc).first(4)
  end

  def about
    raise
    @user = current_user
  end
end

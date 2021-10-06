class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about, :new, :create ]

  def new
    @contact = Contact.new()
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
      if @contact.deliver
        # re-initialize Home object for cleared form
        @user = current_user
        @products = Product.all
        @contact = Contact.new()
        render :home
        # format.js   { flash.now[:success] = @message = "Thank you for your message. I'll get back to you soon!" }
      else
        @user = current_user
        @products = Product.all
        @contact = Contact.new()
        render :home
        # format.js   { flash.now[:error] = @message = "Message did not send." }
      end
  end

  def home
    @contact = Contact.new()
    @user = current_user
    @products = Product.all
  end

  def about
    @user = current_user
  end
end

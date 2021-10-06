class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about ]

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    respond_to do |format|
      if @contact.deliver
        # re-initialize Home object for cleared form
        @contact = Contact.new
        format.html { render 'index'}
        format.js   { flash.now[:success] = @message = "Thank you for your message. I'll get back to you soon!" }
      else
        format.html { render 'index' }
        format.js   { flash.now[:error] = @message = "Message did not send." }
      end
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

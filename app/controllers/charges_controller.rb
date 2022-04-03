class ChargesController < ApplicationController
  # before_action :authenticate_user!

  def new
    @user = current_user
    
    if @user
      @order = Order.where(user: @user, status: 1)[0]
      authorize @user     
      if @order 
        @cart_items = @order.order_items.order(:id) 
        @amount = Order.where(user: @user, status: 1)[0].total
        authorize @order
        return @amount
      end
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @amount = Order.where(user: current_user, status: 1)[0].total
    session = Stripe::Checkout::Session.create({
      line_items: [{
        # Provide the exact Price ID (e.g. pr_1234) of the product you want to sell
        price: "price_1KkR7ZGsOm5WfgBcyWZX3I2v",
        quantity: 1,
      }],
      mode: 'payment',
      success_url: ENV['DOMAIN'] + '/success.html',
      cancel_url: ENV['DOMAIN'] + '/cancel.html',
    })

    redirect_to session.url
    #Create another route called success which is connected to the success_url
    orders_controller = OrdersController.new
    @user = current_user
    @order = Order.where(user: current_user, status: 1)[0]
    authorize @order
    orders_controller.update(@user, @order)  
   else
     
   end
  end
end

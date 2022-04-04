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
      success_url: ENV['DOMAIN'] + '/success',
      cancel_url: ENV['DOMAIN'] + '/cancel',
    })

    redirect_to session.url
  end

  def success_charge
    orders_controller = OrdersController.new
    @user = current_user
    @order = Order.where(user: current_user, status: 1)[0]
    authorize @order
    orders_controller.update(@user, @order)  
    
    redirect_to root_path, notice: "Thank you, your order has been made!"
  end

  def cancel_charge
    redirect_to root_path, notice: "Forgot to add something to your cart? Shop around then come back to pay!"
  end
end

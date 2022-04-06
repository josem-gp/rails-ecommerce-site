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
    @order = Order.where(user: current_user, status: 1)[0] #created this just to overcome the Pundit auth
    @order_id = @order.id
    @order_items = OrderItem.where(order_id: @order_id)
    @hashed_order_items = @order_items.map {|el| {price: Product.find(el.product_id).stripe_price_id, quantity: el.quantity} }

    authorize @order
    session = Stripe::Checkout::Session.create({
      line_items: @hashed_order_items,
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
    @user = current_user
    authorize @user
    redirect_to products_path, notice: "Forgot to add something to your cart? Shop around then come back to pay!"
  end
end

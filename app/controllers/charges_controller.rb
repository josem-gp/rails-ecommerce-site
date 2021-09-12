class ChargesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_description
  

  def new
    if current_user
      @order = Order.where(user: current_user, status: 1)[0]
      @cart_items = @order.order_items if @order
      if @order 
        @amount = Order.where(user: current_user, status: 1)[0].total
        return @amount
      end
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @amount = Order.where(user: current_user, status: 1)[0].total
    customer = StripeTool.create_customer(email: params[:stripeEmail], 
                                          stripe_token: params[:stripeToken])

    charge = StripeTool.create_charge(customer_id: customer.id, 
                                      amount: @amount,
                                      description: @description)

    orders_controller = OrdersController.new
    orders_controller.update(current_user, Order.where(user: current_user, status: 1)[0])

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def thanks
  end

  private

    def set_description
      @description = "Purchase in JapanTea"
    end
end

class ChargesController < ApplicationController
  before_action :authenticate_user!
  before_action :amount_to_be_charged
  before_action :set_description
  

  def new
    if current_user
      @order = Order.where(user: current_user, status: 1)[0]
      @cart_items = @order.order_items if @order
    else
      redirect_to new_user_session_path
    end
  end

  def create
    customer = StripeTool.create_customer(email: params[:stripeEmail], 
                                          stripe_token: params[:stripeToken])

    charge = StripeTool.create_charge(customer_id: customer.id, 
                                      amount: @amount,
                                      description: @description)

    redirect_to thanks_path
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def thanks
    @order = Order.where(user: current_user, status: 1)[0]
    redirect_to order_path(@order), remote: true, method: :patch
  end

  private

    def amount_to_be_charged
      @amount = Order.where(user: current_user, status: 1)[0].total
    end

    def set_description
      @description = "Purchase in JapanTea"
    end
end

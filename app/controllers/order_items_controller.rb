class OrderItemsController < ApplicationController
    def create
        @user = current_user
        @product
        @order_item = OrderItem.new

    end

    def delete
    end
end

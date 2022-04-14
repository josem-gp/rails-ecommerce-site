class UsersController < ApplicationController
    def show
        @user = current_user
        @default_icon = Icon.find(@user.icon.id)
        @icons = Icon.where.not(id: @default_icon).order('name DESC')
        @favorites = @user.all_favorited
        @orders = @user.orders.where(status: 2).order('date DESC')
        @product = Product.new()
        authorize @user
    end

    def update
        @user = current_user
        authorize @user
        if params[:icon_id]
            @icon = Icon.find(params[:icon_id])
            @user.icon = @icon
            @user.save
            redirect_to user_path(@user) 
        elsif params[:user][:email]
            @user.update(user_params)
            redirect_to request.referer
        else
            @user.update(shipping_params)
            shipping_params[:checked] ? @user.update(checked: shipping_params[:checked].to_i) : ""
            @order = @user.orders.where(status: 1)[0]
            @order.update(billing_address: @user.shipping_address)
            redirect_to request.referer
        end
        
    end

    private
    
    def shipping_params
        params.require(:user).permit(:name, :shipping_address, :phone_number, :checked)
    end

    def user_params
        params.require(:user).permit(:name, :email, :shipping_address, :phone_number)
    end
end

class UsersController < ApplicationController
    def show
        @user = current_user
        @default_icon = Icon.find(@user.icon.id)
        @icons = Icon.where.not(id: @default_icon).order('name DESC')
        @favorites = @user.all_favorited
        @orders = @user.orders.where(status: 2)
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = current_user
        @icon = Icon.find(params[:icon_id])
        @user.icon = @icon
        @user.save
        redirect_to user_path(@user)
    end
end

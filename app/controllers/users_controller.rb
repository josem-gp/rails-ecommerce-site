class UsersController < ApplicationController
    def show
        @user = current_user
        @favorites = @user.all_favorited
        @orders = @user.orders.where(status: 2)
    end

    def edit
    end

    def update
    end
end

class UsersController < ApplicationController
    def show
        @user = current_user
        @favorites = @user.all_favorited
        #check this maybe change for all_favorites
        @orders = @user.orders
    end

    def edit
    end

    def update
    end
end

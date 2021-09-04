class UsersController < ApplicationController
    def show
        @user = current_user
        @favorites = @user.all_favorited
    end

    def edit
    end

    def update
    end
end

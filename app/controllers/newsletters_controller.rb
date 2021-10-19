class NewslettersController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :create ]

    def create
        raise
    end

    private
    def newsletter_params
        params.require(:newsletter).permit(:email)
    end
end

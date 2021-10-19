class NewslettersController < ApplicationController
    def create
        raise
    end

    private
    def newsletter_params
        params.require(:newsletter).permit(:email)
    end
end

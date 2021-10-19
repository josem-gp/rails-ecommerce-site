class NewslettersController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :create ]

    def create
        @newsletter = Newsletter.new(newsletter_params)
        authorize @newsletter
        if @newsletter.save
            redirect_to request.referer, notice: "Thank you for subscribing to our newsletter!"
        else 
            redirect_to request.referer, notice: "There was an error in your form"
        end
    end

    private
    def newsletter_params
        params.permit(:email)
    end
end

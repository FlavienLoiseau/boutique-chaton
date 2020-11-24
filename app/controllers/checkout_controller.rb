class CheckoutController < ApplicationController
    def create
        cart = Cart.find(params[:cart_id])

        if cart.nil?
          redirect_to root_path
          return
        end

    Stripe.api_key = Rails.configuration.stripe[:secret_key]

        @session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            line_items: [{
                    name: "Votre panier",
                    description: "Description ici",
                    amount: 42*100,
                    currency: 'eur',
                    quantity: 1
                  }],
            success_url: checkout_success_url,
            cancel_url: checkout_cancel_url,
        })



        respond_to do |format|
            format.js #render create.js.erb
        end


    end
    
    def success
    end
    def cancel
    end

end

class CheckoutController < ApplicationController
    def create
        cart = Cart.find(params[:cart_id])

        if cart.nil?
          redirect_to root_path
          return
        end

    Stripe.api_key = Rails.configuration.stripe[:secret_key]

        def cart_product_names
        names = []
        Cart.find(params[:cart_id]).line_items.each do |line_item|
            names << line_item.product.title
         end
         return names.map{|k,v| "#{k}"}.join(', ')
          
        end


        @session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            line_items: [{
                    name: "Votre panier",
                    description: cart_product_names ,
                    amount: cart.total.to_i*100,
                    currency: 'eur',
                    quantity: 1
                  }],
            success_url: checkout_success_url,
            cancel_url: cart_url(cart),
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

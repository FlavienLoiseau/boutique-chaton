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
                    amount: (cart.total.*100).to_i,
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
        #Passe le statut du panier payé en is_paid true (à la place d'avoir une table commande passée)
        cart = Cart.last
        cart.is_paid = true
        cart.save
        @user = current_user
        
        #Envoie un email récapitulatif du paiement à l'utilisateur
        UserMailer.checkout_success(@user).deliver_now
        UserMailer.new_sale(@user).deliver_now
    end
    def cancel
    end

end

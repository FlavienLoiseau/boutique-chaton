class CheckoutController < ApplicationController
    def create


    
        Stripe.api_key = 'sk_test_33HvkIMjnV9FWwvqoFlibMGs00HNc7nma3'

        @session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            line_items: [{
              price_data: {
                currency: 'eur',
                product_data: {
                  name: "test",
                },
                unit_amount: 5000,
              },
              quantity: 1,
            }],
            mode: 'payment',
            # For now leave these URLs as placeholder values.
            #
            # Later on in the guide, you'll create a real success page, but no need to
            # do it yet.
            success_url: 'https://example.com/success',
            cancel_url: 'https://example.com/cancel',
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

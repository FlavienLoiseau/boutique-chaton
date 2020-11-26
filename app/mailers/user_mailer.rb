class UserMailer < ApplicationMailer
  default from: 'martin.louvard@gmail.com'

  def checkout_success(user)
    @cart = user.carts.last

    mail(to: user.email, subject: "Boutique Chaton - Votre commande n°#{@cart.id}/#{user.id}")

  end
end

class UserMailer < ApplicationMailer
  default from: 'flavien_loiseau@hotmail.com'
 
  def checkout_success(user)
    @cart = user.carts.last

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: user.email, subject: "Boutique Chaton - Votre commande n°#{@cart.id}/#{user.id}") 

  end
end

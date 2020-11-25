class UserMailer < ApplicationMailer
  default from: 'josephineremy2@gmail.com'
 
  def checkout_success(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: `Boutique Chaton - Votre commande n°#{}`) 

  end
end

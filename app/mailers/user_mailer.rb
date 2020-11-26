class UserMailer < ApplicationMailer
  default from: 'martin.louvard@gmail.com'

  def checkout_success(user)
    @cart = user.carts.last
    mail(to: user.email, subject: "Boutique Chaton - Votre commande n°#{@cart.id}/#{user.id}")
  end

  def new_sale(user)
    @cart = user.carts.last
    admins_emails = []
    User.all.each do |u|
      if u.is_admin
        admins_emails << u.email
      end
    end
    mail(to: admins_emails, subject: "Nouvelle commande sur Boutique Chaton !")
  end
end

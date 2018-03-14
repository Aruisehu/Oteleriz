class OrdersMailer < ApplicationMailer
    def order_confirmation(order)
        @order = order
        mail(to: @order.email, subject: 'Cook Me Up: Confirmation de votre commande')
    end
end

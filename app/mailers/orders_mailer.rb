class OrdersMailer < ApplicationMailer
    def confirm(order)
        @order = order
        mail(to: @order.email, subject: 'Cook Me Up: Confirmation de commande pour "' + @order.name + '"')
    end
end

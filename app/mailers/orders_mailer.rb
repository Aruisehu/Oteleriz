class OrdersMailer < ApplicationMailer
    def confirm(order)
        @order = order
        mail(to: @order.email, subject: I18n.t("mailer.order.subject") + '"' + @order.name + '"')
    end
end

class Admin::OrdersController < Admin::BaseController
    def index
        @orders = Order.where(confirmed: true) 
    end
end
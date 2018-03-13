class Admin::OrdersController < Admin::BaseController
    before_action :set_order, only: [:show, :edit, :update, :show, :destroy]
    def index
        @orders = Order.includes(:service).where(confirmed: true)
    end

    def show
    end

    def create
        @order = Order.new(order_params)
        if @order.save
            redirect_to admin_orders_path
        else
            redirect_to admin_orders_path
        end
    end

    def edit
        @orders = Order.find(params[:id])
    end

    def update
        @order.assign_attributes(order_params)
        if @order.save
            redirect_to admin_orders_path
        else
            redirect_to edit_admin_orders_path
        end
    end

    def destroy
        @order.destroy
        redirect_to admin_orders_path
    end

    private

    def set_order
        @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:name_translations, :description_translations, :ask_roasting, :price, :img_url)
    end
end

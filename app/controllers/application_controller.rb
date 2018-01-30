class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :set_locale
    before_action :set_order

    def home
        @starters = Starter.all
        render '/home'
    end

    private
    def title(page_title)
        if page_title.to_s != ""
            @title = page_title.to_s + ' - ' + helpers.site_name
        end
    end

    def set_locale
        unless params[:locale].blank?
            session[:locale] = params[:locale]
        end

        I18n.locale = session[:locale] || I18n.default_locale
    end

    protected
    def set_order
        if session[:order_id].blank?
            session[:order_id] = Order.create(meal: Meal.new).id
        end

        @order = Order.find(session[:order_id])
    end
end

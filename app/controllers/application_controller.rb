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

    def set_order
        unless session[:order]
            session[:order] = Order.new
        end
    end
end

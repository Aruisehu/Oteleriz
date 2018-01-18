class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def home
        render '/home'
    end

    private
    def title(page_title)
        if page_title.to_s != ""
            @title = page_title.to_s + ' - ' + helpers.site_name
        end
    end

    def set_locale
        I18n.locale = :fr # We only serve french content, so we enforce the :fr locale
    end
end

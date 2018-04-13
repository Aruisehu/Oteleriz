module Admin
    class BaseController < ApplicationController
        before_action :admin_user?
        layout 'admin'

        def home
        end

        def admin_user?
            authenticate_user!
            if !current_user.admin?
                redirect_to root_path
            end
        end
    end
end

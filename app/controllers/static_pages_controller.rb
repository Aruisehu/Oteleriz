class StaticPagesController < ApplicationController
    def show
        render "static_pages/#{params[:page]}"
    end
end

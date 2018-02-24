class StaticPagesController < ApplicationController
    def show
        render "static/#{params[:page]}"
    end
end

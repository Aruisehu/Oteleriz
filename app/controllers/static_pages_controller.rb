class StaticPagesController < ApplicationController
    def menu
        @dishes = Dish.all
        @desserts = Dessert.all
        @starters = Starter.all
    end

    def show
        render "static_pages/#{params[:page]}"
    end
end

class StaticPagesController < ApplicationController
    def menu
        @dishes = Dish.all
        @desserts = Dessert.all
        @starters = Starter.all
        @bakings = Baking.all
        @marinades = Marinade.all
    end

    def show
        render "static_pages/#{params[:page]}"
    end
end

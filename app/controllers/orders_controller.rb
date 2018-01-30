class OrdersController < ApplicationController
    def index
        @dishes = Dish.all
        @desserts = Dessert.all
        @starters = Starter.all
        @bakings = Baking.all
        @marinades = Marinade.all
    end

    def update
        @formula = Formula.new(
            {
                starter_id: formula_params[:starter],
                dish_id: formula_params[:dish],
                dessert_id: formula_params[:dessert],
                order: @order
            }.compact
        )


        add_formula

        redirect_to orders_path
    end

    def add_menu

    end

    private
    def add_formula
        if @formula.save
            @order.formulas << @formula

            if @order.save
                flash[:success] = "Produit ajouté au panier"
            else
                flash[:error] = "Une erreur c'est produite"
            end
        else
            flash[:error] = "Une erreur c'est produite"
        end
    end

    def formula_params
        params.require(:formula).permit(:starter, :dish, :dessert)
    end
end

class OrdersController < ApplicationController
    def index
        @dishes = Dish.all
        @desserts = Dessert.all
        @starters = Starter.all
        @bakings = Baking.includes(:marinades).all
        @marinades = Marinade.all
        @course_d = FormulaTemplate.find_by(has_starter: false, has_dish: true, has_dessert: false, has_wine: false)
        @course_sd = FormulaTemplate.find_by(has_starter: true, has_dish: true, has_dessert: false, has_wine: false)
        @course_sdw = FormulaTemplate.find_by(has_starter: true, has_dish: true, has_dessert: false, has_wine: true)
        @course_dd = FormulaTemplate.find_by(has_starter: false, has_dish: true, has_dessert: true, has_wine: false)
        @course_ddw = FormulaTemplate.find_by(has_starter: false, has_dish: true, has_dessert: true, has_wine: true)
        @course_sdd = FormulaTemplate.find_by(has_starter: true, has_dish: true, has_dessert: true, has_wine: false)
        @course_sddw = FormulaTemplate.find_by(has_starter: true, has_dish: true, has_dessert: true, has_wine: true)

        @title = "Notre Carte"
    end

    def update
        @formula = Formula.new(
            {
                starter_id: formula_params[:starter],
                dish_id: formula_params[:dish],
                dessert_id: formula_params[:dessert],
                roasting: formula_params[:roasting],
                baking_id: formula_params[:baking],
                order: @order
            }.compact
        )

        add_formula

        redirect_to orders_path
    end

    def destroy
        @formula = Formula.find(params.require(:formula))

        if @order.formulas.include? @formula
            @order_price = @formula.destroy_from_order
        end

        respond_to do |f|
            f.html { redirect_to orders_path }
            f.js
        end
    end

    def add_menu
        if params[:id]
            @formula_template = FormulaTemplate.find(params[:id])
        else
            @formula_template = FormulaTemplate.find_by(has_dish: true, has_dessert: false, has_starter: false, has_wine: false)
        end
    end

    def validate
        @order.confirmed = true

        if @order.save
            session.delete(:order_id)
            flash[:success] = "Votre commande à été validée"
            redirect_to order_success_path
        else
            flash[:error] = "Une erreur c'est produite lors de la validation de votre commande"
        end
    end

    def success
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
        params.require(:formula).permit(:starter, :dish, :dessert, :baking, :roasting)
    end
end

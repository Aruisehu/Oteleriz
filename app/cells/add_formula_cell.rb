class AddFormulaCell < Cell::ViewModel
    include FontAwesome::Rails::IconHelper
    include ActionView::Helpers::FormHelper

    def show
        @formula = Formula.new

        @order = Order.find(session[:order_id])

        render
    end

    def starter
        if model.starter?
            set_form_context

            @starters = Starter.all

            render
        end
    end

    def dish
        set_form_context

        @dishes = Dish.all
        @bakings = Baking.all
        @marinades = Marinade.all
        @roastings = ["rare", "well_done"]

        render
    end

    def dessert
        if model.dessert?
            set_form_context

            @desserts = Dessert.all

            render
        end
    end

    def submit
        set_form_context

        render
    end

    private
    def set_form_context
        @f = options[:form]
    end
end

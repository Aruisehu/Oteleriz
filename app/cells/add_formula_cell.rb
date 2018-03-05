class AddFormulaCell < Cell::ViewModel
    include FontAwesome::Rails::IconHelper
    include ActionView::Helpers::FormHelper

    def show
        @formula = Formula.new

        @order = Order.find(session[:order_id])

        @random = options[:random]

        render
    end

    def starter
        if model.has_starter?
            set_form_context

            @starters = Starter.all

            if options[:random]
                @starter = @starters.sample
            else
                @starter = @starters.first
            end

            render
        end
    end

    def dish
        set_form_context

        @dishes = Dish.all
        @bakings = Baking.includes(:marinades).all
        @roastings = ["rare", "well_done"]
        @marinades = Marinade.all

        if options[:random]
            @dish = @dishes.sample
            @baking = @bakings.sample
            @roasting = @roastings.sample
        else
            @dish = @dishes.first
            @baking = @bakings.first
            @roasting = @roastings.first
        end

        render
    end

    def dessert
        if model.has_dessert?
            set_form_context

            @desserts = Dessert.all

            if options[:random]
                @dessert = @desserts.sample
            else
                @dessert = @desserts.first
            end

            render
        end
    end

    def wine
        if model.has_wine?
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

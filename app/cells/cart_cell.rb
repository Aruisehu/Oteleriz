class CartCell < Cell::ViewModel
    include FontAwesome::Rails::IconHelper
    property :order

    def show
        @order = model

        template_all = FormulaTemplate.new(
            has_starter: true,
            has_dish: true,
            has_dessert: true
        )

        template_starter_false = FormulaTemplate.new(
            has_starter: false,
            has_dish: true,
            has_dessert: true
        )

        template_dessert_false = FormulaTemplate.new(
            has_starter: true,
            has_dish: true,
            has_dessert: false
        )

        template_dish_only = FormulaTemplate.new(
            has_starter: false,
            has_dish: true,
            has_dessert: false
        )

        unless @order.formulas.empty?
            render
        else
            render 'empty'
        end
    end

    def display
        render
    end

    def dish
        formula = options[:formula]

        @roasting = model.ask_roasting ? formula.roasting : nil
        @cooking = formula.baking
        @marinade = Marinade.find_by(baking: formula.baking, dish: model)

        render
    end

    def starter
        render
    end

    def dessert
        render
    end
end

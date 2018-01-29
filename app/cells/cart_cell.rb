class CartCell < Cell::ViewModel
    include FontAwesome::Rails::IconHelper
    property :order

    def show
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
            has_starter: true,
            has_dish: true,
            has_dessert: false
        )

        formulas = [
            Formula.new(
                formula_template: template_all,
                starter: Starter.all.sample,
                dish: Dish.all.sample,
                dessert: Dessert.all.sample
            ),
            Formula.new(
                formula_template: template_dish_only,
                dish: Dish.all.sample
            )
        ]

        options[:order] = Order.new(formulas: formulas)

        render
    end

    def dish
        render
    end

    def starter
        render
    end

    def dessert
        render
    end
end

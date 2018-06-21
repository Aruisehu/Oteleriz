class CartCell < Cell::ViewModel
    include FontAwesome::Rails::IconHelper
    include ActionView::Helpers::NumberHelper
    include ActionView::Helpers::TranslationHelper
    property :order

    def show
        @order = model

        unless @order.formulas.empty?
            render
        else
            render 'empty'
        end
    end

    def show_admin
        @order = model
        render
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

    def wine
        render
    end
end

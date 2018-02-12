class ProductCell < Cell::ViewModel
    include FontAwesome::Rails::IconHelper
    include ActionView::Helpers::NumberHelper

    def show
        render
    end

    def tiny
        render
    end

    def menu
        render
    end

    def price
        @formula = Formula.new
        unless options[:presentation]
            render
        else
            return ""
        end
    end
end

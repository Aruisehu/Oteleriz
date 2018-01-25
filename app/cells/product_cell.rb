class ProductCell < Cell::ViewModel
    include FontAwesome::Rails::IconHelper

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
        unless options[:presentation]
            render
        else
            return ""
        end
    end
end

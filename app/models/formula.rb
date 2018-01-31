class Formula < ApplicationRecord
    belongs_to :order
    belongs_to :starter, optional: true
    belongs_to :dish, optional: true
    belongs_to :dessert, optional: true
    belongs_to :formula_template, optional: true
    belongs_to :baking, optional: true

    def starter?
        self.formula_template.starter?
    end

    def dish?
        self.formula_template.dish?
    end

    def dessert?
        self.formula_template.dessert?
    end

    def get_products
        return {starter: self.starter, dish: self.dish, dessert: self.dessert}.compact
    end

    def destroy_from_order
        total_price = 1000.00
        price = 12


        # total_price = self.order.price = self.order.price - self.price
        total_price = total_price - price

        self.destroy
        return total_price
    end

    module Roasting
        def self.all
            ["rare", "well_done"]
        end

        self.all.each do |roasting|
            define_method("#{roasting}?") do
                self.roasting == roasting
            end
        end
    end

    include Formula::Roasting

    validates :roasting, inclusion: {in: Formula::Roasting.all}, if: :need_roasting?

    def need_roasting?
        self.dish&.ask_roasting
    end
end

class Formula < ApplicationRecord
    belongs_to :order
    belongs_to :starter, optional: true
    belongs_to :dish, optional: true
    belongs_to :dessert, optional: true
    belongs_to :formula_template, optional: true
    belongs_to :baking, optional: true

    def starter?
        self.formula_template&.starter? || not(self.starter.blank?)
    end

    def dish?
        self.formula_template&.dish? || not(self.dish.blank?)
    end

    def dessert?
        self.formula_template&.dessert? || not(self.dessert.blank?)
    end

    def get_price
        if self.dessert?
            return self.dessert.price
        end
        if self.dish?
            return self.dish.price
        end
        if self.starter?
            return self.starter.price
        end

        self.formula_template.price
    end

    def get_products
        return {starter: self.starter, dish: self.dish, dessert: self.dessert, wine: self.formula_template.wine}.compact
    end

    def destroy_from_order
        total_price = self.order.get_price - self.get_price

        self.destroy
        return total_price
    end

    def valid_template?
        filter = self.formula_template.get_filter
        products = self.get_products

        filter.each do |k, v|
            unless products[k]
                return false
            end
        end

        return true
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

    def summary
        hash = {}
        if self.starter?
            hash[sanitize_name(starter.name)] = 1
        end

        if self.dish?
            if dish.ask_roasting
                hash[sanitize_name(dish.name + " " + baking.name + " " + I18n.t(roasting))] = 1
            else
                hash[sanitize_name(dish.name + " " + baking.name)] = 1
            end
        end

        if self.dessert?
            hash[sanitize_name(dessert.name)] = 1
        end

        if self.formula_template&.has_wine
            hash[sanitize_name(self.formula_template.wine)] = 1
        end
        return hash
    end

    private
    def sanitize_name(name)
        name.downcase.capitalize
    end
end

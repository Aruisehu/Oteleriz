class FormulaTemplate < ApplicationRecord
    has_one :formula
=begin
    alias_method :starter?, :has_starter
    alias_method :dish?, :has_dish
    alias_method :dessert?, :has_dessert
=end

    def starter?
        true
    end

    def dish?
        false
    end

    def dessert?
        false
    end
end

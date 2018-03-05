class FormulaTemplate < ApplicationRecord
    has_one :formula
    translates :name
=begin
    alias_method :starter?, :has_starter
    alias_method :dish?, :has_dish
    alias_method :dessert?, :has_dessert
=end

    def starter?
        self.has_starter && !self.has_dish && !self.has_dessert
    end

    def dish?
        !self.has_starter && self.has_dish && !self.has_dessert
    end

    def dessert?
        !self.has_starter && !self.has_dish && self.has_dessert
    end

    def has_starter?
        self.has_starter
    end

    def has_dish?
        self.has_dish
    end

    def has_dessert?
        self.has_dessert
    end

    def hide?
        dessert? or dish? or starter?
    end

    def self.displayable
        FormulaTemplate.all.select do |f| !f.hide? end
    end

end

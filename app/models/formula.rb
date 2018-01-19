class Formula < ApplicationRecord
    has_and_belongs_to_many :orders
    belongs_to :starter, optional: true
    belongs_to :dish, optional: true
    belongs_to :dessert, optional: true
    belongs_to :formula_template

    def starter?
        self.formula_tempate.starter?
    end

    def dish?
        self.formula_tempate.dish?
    end

    def dessert?
        self.formula_tempate.dessert?
    end

    validate :starter, absence: true, unless: :starter?
    validate :starter, presence: true, if: :starter?

    validate :dish, absence: true, unless: :dish?
    validate :dish, presence: true, if: :dish?

    validate :dessert, absence: true, unless: :dessert?
    validate :dessert, presence: true, if: :dessert?
end

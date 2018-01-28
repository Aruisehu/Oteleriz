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

    module Baking
        def self.all
            ["wok", "papillotte", "fusio"]
        end

        self.all.each do |baking|
            define_method("#{baking}?") do
                self.baking == baking
            end
        end
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

    include Formula::Baking
    include Formula::Roasting


    validates :starter, absence: true, unless: :starter?
    validates :starter, presence: true, if: :starter?

    validates :dish, absence: true, unless: :dish?
    validates :dish, presence: true, if: :dish?

    validates :dessert, absence: true, unless: :dessert?
    validates :dessert, presence: true, if: :dessert?

    validates :baking, inclusion: {in: Formula::Baking.all}, if: :dish?
    validates :roasting, inclusion: {in: Formula::Roasting.all}, if: :need_roasting?

    def need_roasting?
        self.dish? && self.dish&.ask_roasting
    end
end

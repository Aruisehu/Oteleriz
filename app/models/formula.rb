class Formula < ApplicationRecord
    has_and_belongs_to_many :orders
    belongs_to :starter, optional: true
    belongs_to :dish, optional: true
    belongs_to :dessert, optional: true

    alias_method :has_starter?, :starter
    alias_method :has_dish?, :dish
    alias_method :has_dessert?, :dessert
end

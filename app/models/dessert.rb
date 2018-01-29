class Dessert < ApplicationRecord
    has_many :formulas

    translates :name, :description
end

class Baking < ApplicationRecord
    has_many :formulas
    has_many :marinades

    translates :name, :description, :ingredient
end

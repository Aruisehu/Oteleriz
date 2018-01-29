class Dish < ApplicationRecord
    has_many :formulas
    has_many :marinades

    translates :name, :description
end

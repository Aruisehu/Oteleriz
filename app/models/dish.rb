class Dish < ApplicationRecord
    has_many :formulas
    has_many :marinades

end

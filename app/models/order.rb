class Order < ApplicationRecord
    belongs_to :meal
    has_many :formulas
end

class Order < ApplicationRecord
    belongs_to :meal
    has_and_belongs_to_many :menus
end

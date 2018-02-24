class Service < ApplicationRecord
    has_many :orders
    belongs_to :meal
end
